import 'dart:async';
import 'package:cine_loomi/modules/movies/widgets/close_button_overlay.dart';
import 'package:cine_loomi/modules/movies/widgets/comments_list.dart';
import 'package:cine_loomi/modules/movies/widgets/subtitles_overlay.dart';
import 'package:cine_loomi/modules/movies/widgets/video_controls_overlay.dart';
import 'package:cine_loomi/modules/movies/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerScreen extends StatefulWidget {
  final String videoUrl = Get.arguments;
  MoviePlayerScreen({Key? key}) : super(key: key);

  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late VideoPlayerController _controller;
  bool _controlsVisible = false;
  bool _subtitlesVisible = false;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _hideTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _showControls() {
    setState(() {
      _controlsVisible = true;
    });
    _resetHideTimer();
  }

  void _resetHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _controlsVisible = false;
      });
    });
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
    _resetHideTimer();
  }

  Future<void> _rewind15Seconds() async {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition - const Duration(seconds: 15);
    _controller
        .seekTo(newPosition < Duration.zero ? Duration.zero : newPosition);
    _resetHideTimer();
  }

  Future<void> _forward15Seconds() async {
    final currentPosition = _controller.value.position;
    final newPosition = currentPosition + const Duration(seconds: 15);
    _controller.seekTo(newPosition);
    _resetHideTimer();
  }

  void _showComments() {
    _resetHideTimer();
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Comments",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CommentsList();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? GestureDetector(
              onTap: _showControls,
              child: Stack(
                children: [
                  VideoPlayerWidget(controller: _controller),
                  if (_subtitlesVisible) const SubtitlesOverlay(),
                  if (_controlsVisible)
                    VideoControlsOverlay(
                      controller: _controller,
                      showSubtitles: _subtitlesVisible,
                      onTogglePlayPause: _togglePlayPause,
                      onRewind: _rewind15Seconds,
                      onForward: _forward15Seconds,
                      onSubtitleToggle: () {
                        setState(() {
                          _subtitlesVisible = !_subtitlesVisible;
                        });
                        _resetHideTimer();
                      },
                      onCommentsTap: _showComments,
                      onSliderChanged: (newValue) {
                        final duration = _controller.value.duration;
                        final newPosition = Duration(
                            milliseconds:
                                (duration.inMilliseconds * newValue).round());
                        _controller.seekTo(newPosition);
                        _resetHideTimer();
                      },
                    ),
                  const CloseButtonOverlay(),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

import 'dart:async';
import 'package:cine_loomi/modules/movies/widgets/comments_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MoviePlayerScreen extends StatefulWidget {
  final String imageUrl = Get.arguments;
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

    _controller = VideoPlayerController.network(widget.imageUrl)
      ..initialize().then((_) {
        setState(() {});
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
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
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
      barrierLabel: "Comentários",
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

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    double iconSize = 48,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: iconSize,
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
      ],
    );
  }

  Widget _buildControlsOverlay() {
    final duration = _controller.value.duration;
    final position = _controller.value.position;
    final progress = duration.inMilliseconds > 0
        ? position.inMilliseconds / duration.inMilliseconds
        : 0.0;

    return Stack(
      children: [
        Positioned(
          top: 20,
          right: 20,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.subtitles,
                    color: _subtitlesVisible ? Colors.yellow : Colors.white),
                onPressed: () {
                  setState(() {
                    _subtitlesVisible = !_subtitlesVisible;
                  });
                  _resetHideTimer();
                },
              ),
              IconButton(
                icon: const Icon(Icons.comment, color: Colors.white),
                onPressed: _showComments,
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                iconSize: 24,
                icon: ImageIcon(
                  AssetImage('assets/images/back_icon.png'),
                  color: Colors.white,
                ),
                onPressed: _rewind15Seconds,
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 50,
                icon: Icon(
                  _controller.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  color: Colors.white,
                ),
                onPressed: _togglePlayPause,
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 24,
                icon: ImageIcon(
                  AssetImage('assets/images/icon_foward.png'),
                  color: Colors.white,
                ),
                onPressed: _forward15Seconds,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 30,
          right: 30,
          child: Slider(
            activeColor: Colors.purple,
            inactiveColor: Colors.white54,
            value: progress.clamp(0.0, 1.0),
            onChanged: (newValue) {
              final newPosition = Duration(
                  milliseconds: (duration.inMilliseconds * newValue).round());
              _controller.seekTo(newPosition);
              _resetHideTimer();
            },
          ),
        ),
      ],
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
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  if (_subtitlesVisible)
                    Positioned(
                      bottom: 50,
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        color: Colors.black54,
                        child: const Text(
                          'Legenda: Texto de exemplo da legenda.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  if (_controlsVisible) _buildControlsOverlay(),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Get.offAllNamed('/home');
                      },
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

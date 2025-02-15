import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  final bool showSubtitles;
  final VoidCallback onTogglePlayPause;
  final VoidCallback onRewind;
  final VoidCallback onForward;
  final VoidCallback onSubtitleToggle;
  final VoidCallback onCommentsTap;
  final ValueChanged<double> onSliderChanged;

  const VideoControlsOverlay({
    Key? key,
    required this.controller,
    required this.showSubtitles,
    required this.onTogglePlayPause,
    required this.onRewind,
    required this.onForward,
    required this.onSubtitleToggle,
    required this.onCommentsTap,
    required this.onSliderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = controller.value.duration;
    final position = controller.value.position;
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
                    color: showSubtitles ? Colors.yellow : Colors.white),
                onPressed: onSubtitleToggle,
              ),
              IconButton(
                icon: const Icon(Icons.comment, color: Colors.white),
                onPressed: onCommentsTap,
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
                icon: const ImageIcon(
                  AssetImage('assets/images/back_icon.png'),
                  color: Colors.white,
                ),
                onPressed: onRewind,
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 50,
                icon: Icon(
                  controller.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  color: Colors.white,
                ),
                onPressed: onTogglePlayPause,
              ),
              const SizedBox(width: 20),
              IconButton(
                iconSize: 24,
                icon: const ImageIcon(
                  AssetImage('assets/images/icon_foward.png'),
                  color: Colors.white,
                ),
                onPressed: onForward,
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
            onChanged: onSliderChanged,
          ),
        ),
      ],
    );
  }
}

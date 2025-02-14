import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MoviePlayerScreen extends StatefulWidget {
  final String imageUrl = Get.arguments;
  MoviePlayerScreen({Key? key}) : super(key: key);

  @override
  State<MoviePlayerScreen> createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late final player = Player();
  late final controller = VideoController(player);
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    player.open(Media(widget.imageUrl));
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

    player.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (player.state.playing) {
      player.pause();
      setState(() => isPlaying = false);
    } else {
      player.play();
      setState(() => isPlaying = true);
    }
  }

  Future<void> _rewind15Seconds() async {
    final currentPosition = await player.streams.position.first;
    final newPosition = currentPosition - const Duration(seconds: 15);
    player.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
  }

  Future<void> _forward15Seconds() async {
    final currentPosition = await player.streams.position.first;
    final newPosition = currentPosition + const Duration(seconds: 15);
    player.seek(newPosition);
  }

  Widget _buildControlButton({
    required IconData icon,
    String? label,
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
        if (label != null)
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Video(
              controller: controller,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Get.offAllNamed('/home');
                },
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.subtitles, color: Colors.white),
                onPressed: () {
                  print("Menu de legendas acionado");
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildControlButton(
                  icon: Icons.replay_10,
                  label: "15s",
                  onPressed: _rewind15Seconds,
                ),
                const SizedBox(width: 20),
                IconButton(
                  iconSize: 64,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled,
                    color: Colors.white,
                  ),
                  onPressed: _togglePlayPause,
                ),
                const SizedBox(width: 20),
                _buildControlButton(
                  icon: Icons.forward_10,
                  label: "15s",
                  onPressed: _forward15Seconds,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

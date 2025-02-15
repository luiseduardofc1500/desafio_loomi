import 'package:cine_loomi/modules/movies/controllers/like_controller.dart';
import 'package:cine_loomi/modules/movies/models/MovieModels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class BannerMovieWithTrailer extends StatefulWidget {
  final MovieModel movie;
  const BannerMovieWithTrailer({super.key, required this.movie});

  @override
  State<BannerMovieWithTrailer> createState() => _BannerMovieWithTrailerState();
}

class _BannerMovieWithTrailerState extends State<BannerMovieWithTrailer> {
  final LikeController controller = Get.put(LikeController());
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayer;

  void _exibirOpcoes() {
    Get.bottomSheet(
      Container(
        height: 150,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.thumb_up, color: Colors.red),
              title: const Text('Like'),
              onTap: () {
                controller.setLike();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.thumb_down, color: Colors.blue),
              title: const Text('Dislike'),
              onTap: () {
                controller.setDislike();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.movie.streamLink),
    );
    _controller.setVolume(0);

    _initializeVideoPlayer = _initializeAndDelay();
  }

  Future<void> _initializeAndDelay() async {
    await _controller.initialize();
    await Future.delayed(const Duration(seconds: 5));
    _controller.play();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FutureBuilder(
              future: _initializeVideoPlayer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  );
                } else {
                  if (widget.movie.poster != null) {
                    return Image.network(
                      widget.movie.poster!.url,
                      fit: BoxFit.cover,
                    );
                  }
                  return Container(color: Colors.black);
                }
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.5),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.genre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Epilogue',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.movie.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Epilogue',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.movie.synopsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Epilogue',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Comments 1.322',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Epilogue',
                        ),
                      ),
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        ),
                        title: Text(
                          'Lorem ipsum dolor sit amet, consect...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Epilogue',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed(
                              '/home/movie',
                              arguments: widget.movie.streamLink,
                            );
                          },
                          child: const Text(
                            'Watch',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Epilogue',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Obx(
                                () => IconButton(
                                  icon: Icon(controller.currentIcon.value,
                                      size: 20),
                                  color: Colors.white,
                                  onPressed: _exibirOpcoes,
                                ),
                              ),
                              const Text(
                                'Like',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Epilogue',
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.send_outlined),
                                color: Colors.white,
                                onPressed: () async {
                                  await Share.share(widget.movie.streamLink);
                                },
                              ),
                              const Text(
                                'Gift to Someone',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Epilogue',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            const Text(
                              'Available until',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.45),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Epilogue',
                              ),
                            ),
                            Text(
                              'Mai. 31, 2023',
                              style: const TextStyle(
                                color: Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Epilogue',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

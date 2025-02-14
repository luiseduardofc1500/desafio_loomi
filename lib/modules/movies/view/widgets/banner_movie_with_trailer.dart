import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class BannerMovieWithTrailer extends StatefulWidget {
  const BannerMovieWithTrailer({super.key});

  @override
  State<BannerMovieWithTrailer> createState() => _BannerMovieState();
}

class _BannerMovieState extends State<BannerMovieWithTrailer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayer;
  final String url =
      'https://s3-figma-videos-production-sig.figma.com/video/1137114552518648666/TEAM/6ebd/23b4/-cd4c-432a-8374-98cbe9c3af35?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=toFiI~XzpilC8gMip9SXwEJhu96eUc-Am7eK1E~O5FbfyRoWGnqUsxYrfx4vfyrw5n~Y31ea1nMlpB4NjmRkVSHGXmKS9ZeEsinhOL6d-2buggx9mT9EDf~H9bkl1ZhDq8rmtmz7-JylTZJuKPDFcIXqfmVOpnM2qaJM98Fh9UbEerPkfUMHnL1KObl5IAoq35FDWQFuS5dwPGAO1BEgKSRQmZHlGd44Naw2-1O3etRH6XknP6hElh0NBvl6p0Q~xbGXxj4cdhTWbak~o0Pi4N32336q5K7FQ36kY11smxUpYQjUb-jSd6w5Qa-8IhblwDGoMPWEzrWNxJckUxTjag__';

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(url));
    _controller.setLooping(true);
    _controller.setVolume(0);

    _initializeVideoPlayer = _initializeAndDelay();
  }

  Future<void> _initializeAndDelay() async {
    await _controller.initialize();
    await Future.delayed(const Duration(seconds: 10));
    _controller.play();
    setState(() {});
  }

  @override
  void dispose() {
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
                  return VideoPlayer(_controller);
                } else {
                  return Image.asset(
                    'assets/images/movie1.png',
                    fit: BoxFit.cover,
                  );
                }
              },
            ),
            // Overlay com gradiente
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Conteúdo sobre o fundo (texto, botões, etc.)
            Positioned(
              bottom: 150,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Musical',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Epilogue',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Barbie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Epilogue',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                    style: TextStyle(
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
                      Text(
                        'Comments 1.322',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Epilogue',
                        ),
                      ),
                      ListTile(
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
                            Get.toNamed('/home/movie');
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
              bottom: 40,
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
                              IconButton(
                                icon: const Icon(Icons.favorite_border),
                                color: Colors.white,
                                onPressed: () {
                                  showBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 200,
                                        color: Colors.white,
                                      );
                                    },
                                  );
                                },
                              ),
                              Text(
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
                                  await Share.share(
                                    'https://youtu.be/4w5yruQFEoY?feature=shared',
                                  );
                                },
                              ),
                              Text(
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
                      Column(
                        children: [
                          Text(
                            'Avaiable until',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.45),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Epilogue',
                            ),
                          ),
                          Text(
                            'Fev 29, 2023',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Epilogue',
                            ),
                          ),
                        ],
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

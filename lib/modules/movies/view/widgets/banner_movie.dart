import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class BannerMovie extends StatelessWidget {
  const BannerMovie({super.key});

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
            Image.asset(
              'assets/images/movie1.png',
              fit: BoxFit.cover,
            ),
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
                      SizedBox(height: 20),
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
                                      });
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
                                      'https://youtu.be/4w5yruQFEoY?feature=shared');
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

import 'package:cine_loomi/modules/movies/api/api_movie.dart';
import 'package:cine_loomi/modules/movies/models/MovieModels.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cine_loomi/modules/auth/widgets/logo_widget.dart';
import 'package:cine_loomi/modules/profile/widgets/avatar.dart';
import 'package:cine_loomi/modules/movies/widgets/banner_movie_with_trailer.dart';
import 'package:cine_loomi/modules/movies/widgets/movie_background.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final MovieRepository movieRepository = MovieRepository(Dio());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: movieRepository.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error when loading movies'),
            ),
          );
        }
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final movie = snapshot.data!.first;
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: MovieBackground(
              imageUrl: movie.poster!.url,
              child: SafeArea(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const LogoWidget(),
                      centerTitle: true,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/home/profile');
                            },
                            child: const Avatar(radius: 20),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Now Showing',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Fieldwork',
                            ),
                          ),
                          const SizedBox(height: 8),
                          BannerMovieWithTrailer(movie: movie),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('Films not found'),
          ),
        );
      },
    );
  }
}

import 'package:cine_loomi/modules/movies/view/widgets/banner_movie_with_trailer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cine_loomi/modules/auth/widgets/logo_widget.dart';
import 'package:cine_loomi/modules/profile/widgets/avatar.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Color _startColor = Colors.black;
  Color _endColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final imageProvider = const AssetImage('assets/images/movie1.png');

    final palette = await PaletteGenerator.fromImageProvider(
      imageProvider,
      size: const Size(200, 100),
    );

    setState(() {
      _startColor = palette.dominantColor?.color ?? Colors.black;
      _endColor = palette.darkMutedColor?.color ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_startColor, _endColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
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
                      child: const Avatar(radius: 30),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Now Showing',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Fieldwork',
                      ),
                    ),
                    SizedBox(height: 8),
                    BannerMovieWithTrailer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

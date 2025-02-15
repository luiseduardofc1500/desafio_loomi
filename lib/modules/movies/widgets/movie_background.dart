import 'package:cine_loomi/modules/movies/util.dart';
import 'package:flutter/material.dart';

/// Widget de fundo que aplica a imagem e o gradiente gerado
class MovieBackground extends StatefulWidget {
  final Widget child;
  final String? imageUrl; // Se for nulo, utiliza um asset padrão

  const MovieBackground({
    Key? key,
    required this.child,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<MovieBackground> createState() => _MovieBackgroundState();
}

class _MovieBackgroundState extends State<MovieBackground> {
  Future<LinearGradient?>? _gradientFuture;

  @override
  void initState() {
    super.initState();
    if (widget.imageUrl != null) {
      _gradientFuture = createMovieGradient(widget.imageUrl!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LinearGradient?>(
      future: _gradientFuture,
      builder: (context, snapshot) {
        LinearGradient gradient = snapshot.data ??
            const LinearGradient(
              colors: [Colors.black87, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            );

        return Stack(
          children: [
            // 2. Overlay do gradiente
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(gradient: gradient),
              ),
            ),
            // 3. Conteúdo principal
            widget.child,
          ],
        );
      },
    );
  }
}

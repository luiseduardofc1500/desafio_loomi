import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String imageUrl;
  final String texto;
  final String year;
  const BannerWidget({
    Key? key,
    required this.imageUrl,
    required this.texto,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 200,
          height: 150,
          color: Colors.black.withOpacity(0.4),
        ),
        Container(
          width: 200,
          height: 150,
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$texto • $year',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

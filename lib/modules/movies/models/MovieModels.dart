import 'package:cine_loomi/modules/movies/models/PosterModel.dart';

class MovieModel {
  final int id;
  final String name;
  final String synopsis;
  final bool currentlyPlaying;
  final String streamLink;
  final String genre;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final PosterModel? poster;

  MovieModel({
    required this.id,
    required this.name,
    required this.synopsis,
    required this.currentlyPlaying,
    required this.streamLink,
    required this.genre,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    this.poster,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return MovieModel(
      id: json['id'],
      name: attributes['name'],
      synopsis: attributes['synopsis'],
      currentlyPlaying: attributes['currently_playing'],
      streamLink: attributes['stream_link'],
      genre: attributes['genre'],
      endDate: DateTime.parse(attributes['end_date']),
      createdAt: DateTime.parse(attributes['createdAt']),
      updatedAt: DateTime.parse(attributes['updatedAt']),
      publishedAt: DateTime.parse(attributes['publishedAt']),
      // Verifica se existe poster e se os dados não são nulos
      poster:
          attributes['poster'] != null && attributes['poster']['data'] != null
              ? PosterModel.fromJson(attributes['poster']['data'])
              : null,
    );
  }
}

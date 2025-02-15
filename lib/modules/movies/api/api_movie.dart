import 'package:cine_loomi/modules/movies/models/MovieModels.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final Dio dio;
  final String _baseUrl =
      'https://untold-strapi.api.prod.loomi.com.br/api/movies?populate=poster';

  MovieRepository(this.dio);

  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await dio.request(
        _baseUrl,
        options: Options(method: 'GET'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((e) => MovieModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}

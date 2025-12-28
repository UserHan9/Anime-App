import 'package:dio/dio.dart';
import '../data/model/anime.dart';

class ApiService {
  static const String _baseUrl = 'https://api.jikan.moe/v4';
  final Dio _dio = Dio();

  Future<TopAnimeResponse> getTopAnime() async {
    final response = await _dio.get('$_baseUrl/top/anime');
    return TopAnimeResponse.fromJson(response.data);
  }
}


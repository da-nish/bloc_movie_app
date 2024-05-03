import 'package:dio/dio.dart';
import 'package:wework_app/app/network/dto/now_playing_model.dart';
import 'package:wework_app/app/network/dto/top_rated_model.dart';

class MovieRepository {
  MovieRepository(this.dio);

  final Dio dio;
  String? _token;

  // void token(String token) {
  //   _token = token;
  //   dio.options.headers["Authorization"] = "Bearer $token";
  // }

  get getToken => _token;

  Future<NowPlayingModel> nowPlayingMovies({int page = 1}) async =>
      NowPlayingModel.fromJson(
          (await dio.get("/3/movie/now_playing?language=en-US&page=$page")).data
              as Map<String, dynamic>);

  Future<TopRatedModel> topRatedMovies({int page = 1}) async =>
      TopRatedModel.fromJson(
          (await dio.get("/3/movie/top_rated?language=en-US&page=$page")).data
              as Map<String, dynamic>);
}

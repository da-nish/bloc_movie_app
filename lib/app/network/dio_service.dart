import 'package:wework_app/app/network/repository/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:wework_app/app/util/logger.dart';

class DioService {
  Dio? _dioClientInstance;

  Dio? get dioClient => _dioClientInstance;

  DioService() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://api.themoviedb.org",
      connectTimeout: const Duration(milliseconds: 16 * 1000),
      receiveTimeout: const Duration(milliseconds: 16 * 1000),
      sendTimeout: const Duration(milliseconds: 16 * 1000),
      headers: {"x-cid": "mnik"},
    );

    final prettyDioLogger = CustomAPILogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true, //kDebugMode,
      responseHeader: false,
      error: true,
      compact: true,
    );

    _dioClientInstance = Dio(options);
    addAuthorizationHeader();
    _dioClientInstance?.interceptors.add(prettyDioLogger);
  }

  void addAuthorizationHeader() {
    _dioClientInstance?.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTg3ZTY4MDMyODIwMTIzZmQ0Yzg0YjQzNDhjYjc3ZCIsInN1YiI6IjY2Mjg5NDExOTFmMGVhMDE0YjAwOWU1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6zIM73Giwg5M4wP6MX8KDCpee7IMnpnLTZUyMpETb08";
  }
}

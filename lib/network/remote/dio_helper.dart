import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    print('Dio init');
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
//https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=ec4e01a3521e490f9c7c9f29e7accb51

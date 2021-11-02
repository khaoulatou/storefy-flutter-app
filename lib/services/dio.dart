import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl =
      'http://192.168.1.46:8000/api/v1/'; //put your address ip
  dio.options.headers['accept'] = 'application/json';

  return dio;
}

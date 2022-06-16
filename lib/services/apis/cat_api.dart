import 'package:dio/dio.dart';

class CatAPI {
  final _urlApi = 'https://api.thecatapi.com/v1/breeds';
  final _key = {"x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"};
  final _dio = Dio();

  Future<dynamic> getData() async {
    final response = await _dio.get(_urlApi, options: Options(headers: _key));
    return response.data;
  }
}

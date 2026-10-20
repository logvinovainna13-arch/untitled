import 'package:dio/dio.dart';

class PetRepository{
  final Dio _dio = Dio();

  Future<String> getRandomFoxImage() async {
    final Response response = await _dio.get(
      'https://randomfox.ca/floof/',
    );

    return response.data ['image'];

  }
}
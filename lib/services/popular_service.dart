import 'package:depi_task/models/popular_model.dart';
import 'package:dio/dio.dart';

class PopularService {
  final String baseUrl =
      'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b';

  Dio dio = Dio();

  Future<PopularModel?> getAllPopulars() async {
    Response response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      dynamic data = PopularModel.fromJson(response.data);
      return data;
    } else {
      return null;
    }
  }
}

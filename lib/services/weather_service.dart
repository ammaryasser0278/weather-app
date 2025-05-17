import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String apiKey = '833fa9c81aff40dd95b124446251505';

  final String baseUrl = 'http://api.weatherapi.com/v1';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$city',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Ooops there was an error';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Ooops there was an error');
    }
  }
}
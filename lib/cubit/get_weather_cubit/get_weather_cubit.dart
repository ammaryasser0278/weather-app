import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

//create cubit
class GetWeatherCubit extends Cubit<GetWeatherStates> {
  GetWeatherCubit() : super(NoWeatherState()); //initial state

  WeatherModel? weatherModel;
  //create function
  Future getWeather({required String cityName}) async {
    try {
      emit(LoadingWeatherState());
      weatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(city: cityName);
      emit(LoadedWeatherState(weatherModel: weatherModel!));
    } catch (e) {
      emit(FailureWeatherState(e.toString()));
    }
  }
}

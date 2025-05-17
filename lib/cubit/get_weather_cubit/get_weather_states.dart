//create state
import 'package:weather_app/models/weather_model.dart';

class GetWeatherStates {}

class NoWeatherState extends GetWeatherStates {}

class LoadingWeatherState extends GetWeatherStates {}

class LoadedWeatherState extends GetWeatherStates {
  final WeatherModel weatherModel;

  LoadedWeatherState({required this.weatherModel});
}

class FailureWeatherState extends GetWeatherStates {
  final String errorMessage;

  FailureWeatherState(this.errorMessage);
}

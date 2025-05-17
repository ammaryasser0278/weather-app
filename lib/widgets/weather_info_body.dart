import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  final WeatherModel weather;
  const WeatherInfoBody({super.key, required this.weather});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getWeatherColor(weatherModel.weatherState).shade400,
              getWeatherColor(weatherModel.weatherState).shade300,
              getWeatherColor(weatherModel.weatherState).shade200,
              getWeatherColor(weatherModel.weatherState).shade100,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: weatherModel.city,
                size: 20.0,
                weight: FontWeight.bold,
              ),
              CustomText(
                text:
                    'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                size: 17.0,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https:${weatherModel.image}'),
                  CustomText(
                    text: '${weatherModel.temp.round()} °C',
                    size: 18.0,
                    weight: FontWeight.bold,
                  ),
                  Column(
                    children: [
                      CustomText(
                        text: 'Max Temp: ${weatherModel.maxTemp.round()} °C',
                        size: 14.0,
                        weight: FontWeight.w500,
                      ),
                      CustomText(
                        text: 'Min Temp: ${weatherModel.minTemp.round()} °C',
                        size: 14.0,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              CustomText(
                text: weatherModel.weatherState,
                size: 20.0,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size, fontWeight: weight));
  }
}

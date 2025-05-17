import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //provide cuibt
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:
            (context) => BlocBuilder<GetWeatherCubit, GetWeatherStates>(
              builder: (context, state) {
                final themeColor =
                    (state is LoadedWeatherState)
                        ? getWeatherColor(state.weatherModel.weatherState)
                        : Colors.blue;
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: themeColor,
                    appBarTheme: AppBarTheme(backgroundColor: themeColor),
                  ),
                  title: 'Weather App',
                  home: const HomeView(),
                );
              },
            ),
      ),
    );
  }
}

//function that return a material color depends on the weather state
MaterialColor getWeatherColor(String? condition) {
  if (condition == null || condition.isEmpty) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;

    case 'Partly cloudy':
    case 'Fog':
      return Colors.grey;

    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy light snow':
      return Colors.blueGrey;

    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Patchy light rain':
      return Colors.blue;

    case 'Thundery outbreaks possible':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Heavy drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.lightBlue;

    default:
      return Colors.blue; // Default color for unknown conditions
  }
}

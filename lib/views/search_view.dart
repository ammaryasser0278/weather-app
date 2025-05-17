import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/custom_icon_button.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: Icons.arrow_back,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Search a City',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: TextField(
              onSubmitted: (value) {
                BlocProvider.of<GetWeatherCubit>(
                  context,
                ).getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                label: Text(
                  'Search',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                hintText: 'Enter City Name',
                hintStyle: TextStyle(fontSize: 14.0),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

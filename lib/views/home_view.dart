import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/custom_icon_button.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          CustomIconButton(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            icon: Icons.search,
          ),
        ],
      ),
      //integrate cuibt
      body: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is LoadingWeatherState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is LoadedWeatherState) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else {
            return const Text('Error : Opps there was an error');
          }
        },
      ),
    );
  }
}

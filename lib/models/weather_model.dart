class WeatherModel {
  final String city;
  final DateTime date;
  final String weatherState;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;

  WeatherModel({
    required this.city,
    required this.date,
    required this.weatherState,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      weatherState:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
    );
  }
}

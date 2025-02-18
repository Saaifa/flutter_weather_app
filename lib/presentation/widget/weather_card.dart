import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/model/weather_model.dart';
class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weather.cityName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.network(
              "https://toppng.com/uploads/preview/bright-sun-some-clouds-weather-symbols-11563056410dvy7razflj.png",
              height: 80,
            ),
            Text(
              "${weather.temperature}°C",
              style: TextStyle(fontSize: 40),
            ),
            Text("Humidity: ${weather.humidity}%"),
            Text("Wind Speed: ${weather.windSpeed} m/s"),
            Text(weather.description.toUpperCase()),
          ],
        ),
      ),
    );
  }
}

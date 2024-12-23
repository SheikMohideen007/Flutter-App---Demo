import 'dart:ffi';

class ForecastWeather {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String climate;
  final double windSpeed;
  final int humidity;
  final double uv;
  final String sunrise;
  final Map<String, dynamic> hour1;
  final Map<String, dynamic> hour2;
  final Map<String, dynamic> hour3;
  final Map<String, dynamic> hour4;

  ForecastWeather(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.climate,
      required this.windSpeed,
      required this.humidity,
      required this.uv,
      required this.sunrise,
      required this.hour1,
      required this.hour2,
      required this.hour3,
      required this.hour4});

  factory ForecastWeather.fromJson(Map<String, dynamic> json, int day) {
    print('object... ${json['forecast']['forecastday'][day]['date']}');
    DateTime currTime = DateTime.now();
    int currHour = currTime.hour;
    return ForecastWeather(
        date: json['forecast']['forecastday'][day]['date'],
        maxTemp: json['forecast']['forecastday'][day]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][day]['day']['mintemp_c'],
        climate: json['forecast']['forecastday'][day]['day']['condition']
            ['text'],
        windSpeed: json['forecast']['forecastday'][day]['day']['maxwind_kph'],
        humidity: json['forecast']['forecastday'][day]['day']['avghumidity'],
        uv: json['forecast']['forecastday'][day]['day']['uv'],
        sunrise: json['forecast']['forecastday'][day]['astro']['sunrise'],
        hour1: json['forecast']['forecastday'][day]['hour']
            [(currHour + 1) % 24],
        hour2: json['forecast']['forecastday'][day]['hour']
            [(currHour + 2) % 24],
        hour3: json['forecast']['forecastday'][day]['hour']
            [(currHour + 3) % 24],
        hour4: json['forecast']['forecastday'][day]['hour']
            [(currHour + 4) % 24]);
  }
}

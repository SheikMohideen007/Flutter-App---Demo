import 'dart:ffi';

class CurrentWeather {
  final String lastUpdated;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String climate;
  final double windSpeed;
  final int humidity;
  final double uv;
  final Map<String, dynamic> hour1;
  final Map<String, dynamic> hour2;
  final Map<String, dynamic> hour3;
  final Map<String, dynamic> hour4;

  CurrentWeather(
      {required this.lastUpdated,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.climate,
      required this.windSpeed,
      required this.humidity,
      required this.uv,
      required this.hour1,
      required this.hour2,
      required this.hour3,
      required this.hour4});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    // print('object... ${json['current']['temp_c'].runtimeType}');
    DateTime currTime = DateTime.now();
    int currHour = currTime.hour;
    return CurrentWeather(
        lastUpdated: json['current']['last_updated'] as String,
        temp: json['current']['temp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        climate: json['current']['condition']['text'],
        windSpeed: json['current']['wind_kph'],
        humidity: json['current']['humidity'],
        uv: json['current']['uv'],
        hour1: json['forecast']['forecastday'][0]['hour'][(currHour + 1) % 24],
        hour2: json['forecast']['forecastday'][0]['hour'][(currHour + 2) % 24],
        hour3: json['forecast']['forecastday'][0]['hour'][(currHour + 3) % 24],
        hour4: json['forecast']['forecastday'][0]['hour'][(currHour + 4) % 24]);
  }
}

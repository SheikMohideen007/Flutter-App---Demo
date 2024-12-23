import 'dart:convert';

// import 'package:weatherapp/services/api_consts.dart';
import 'package:api_handler/services/api_consts.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String key = APIKey;

  fetchDataFromWeatherAPI() async {
    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=$key&q=Chennai&days=6&aqi=yes&alerts=no";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    // print(jsonData['forecast']['forecastday'][0]['date']);
    return jsonData as Map<String, dynamic>;
  }
}

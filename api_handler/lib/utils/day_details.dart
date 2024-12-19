import 'package:api_handler/utils/rounded_image.dart';
import 'package:flutter/material.dart';

class DayDetailsCard extends StatefulWidget {
  final int day;
  const DayDetailsCard(
      {super.key,
      required this.isExpanded,
      required this.devHeight,
      required this.day});

  final bool isExpanded;
  final double devHeight;

  @override
  State<DayDetailsCard> createState() => _DayDetailsCardState();
}

class _DayDetailsCardState extends State<DayDetailsCard> {
  String currWindspeed = "", currUv = "", currHumidity = "", currSunrise = "";

  Map<String, dynamic> hour1 = {}, hour2 = {}, hour3 = {}, hour4 = {};

  String currClimate = "";

  // @override
  // void initState() {
  //   super.initState();
  //   fetchForecastWeather();
  // }

  // fetchForecastWeather() async {
  //   Map<String, dynamic> json = await ApiService().fetchDataFromWeatherAPI();
  //   ForecastWeather weather = ForecastWeather.fromJson(json, widget.day);
  //   setState(() {
  //     currUv = weather.uv.toString();
  //     currWindspeed = weather.windSpeed.toString();
  //     currHumidity = weather.humidity.toString();
  //     currSunrise = weather.sunrise;
  //     hour1 = weather.hour1;
  //     hour2 = weather.hour2;
  //     hour3 = weather.hour3;
  //     hour4 = weather.hour4;
  //     currClimate = weather.climate;
  //   });
  // }

  String getImage({required String currClimate}) {
    return currClimate == "Sunny"
        ? 'sun'
        : currClimate == "Mist"
            ? 'haze'
            : currClimate == "Clear" || currClimate == "Cloudy"
                ? 'clouds'
                : currClimate.contains("rain")
                    ? 'rain'
                    : currClimate.contains("Partly")
                        ? 'partlycloud'
                        : currClimate == "Thunder"
                            ? 'thunder'
                            : currClimate.contains('drizzle')
                                ? 'drizzle'
                                : 'wind';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: widget.isExpanded ? 260 : 0,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(children: [
                        SizedBox(
                            height: 30,
                            child: Image.asset('images/windspeed.png')),
                        SizedBox(width: 5),
                        Text('$currWindspeed KPH',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      Text('Wind Speed',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      Row(children: [
                        SizedBox(
                            height: 30,
                            child: Image.asset('images/humidity.png')),
                        SizedBox(width: 5),
                        Text(currHumidity,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      Text('Humidity',
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      Row(children: [
                        SizedBox(
                            height: 30, child: Image.asset('images/uv.png')),
                        SizedBox(width: 5),
                        Text(currUv,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                      Text('UV', style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
              SizedBox(height: 25),
              Container(
                height: 2,
                color: Colors.grey.shade500,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedImage(
                    devHeight: widget.devHeight,
                    climate:
                        'wind', //getImage(currClimate: hour1['condition']['text']),
                    time: '10.00', //(hour1['time'].split(" ")[1]) ?? 'N/A',
                    degree: '23', //'${hour1['temp_c']}'
                  ),
                  RoundedImage(
                    devHeight: widget.devHeight,
                    climate:
                        'wind', //getImage(currClimate: hour2['condition']['text']),
                    time: '10.00', //(hour2['time'].split(" ")[1]) ?? 'N/A',
                    degree: '23', //'${hour2['temp_c']}'
                  ),
                  RoundedImage(
                      devHeight: widget.devHeight,
                      climate: 'sunset',
                      time: currSunrise,
                      degree: 'Sunrise'),
                  RoundedImage(
                    devHeight: widget.devHeight,
                    climate:
                        'wind', //getImage(currClimate: hour3['condition']['text']),
                    time: '10.00', //(hour3['time'].split(" ")[1]) ?? 'N/A',
                    degree: '23', //'${hour3['temp_c']}'
                  ),
                  RoundedImage(
                    devHeight: widget.devHeight,
                    climate:
                        'wind', //getImage(currClimate: hour4['condition']['text']),
                    time: '10.00', //(hour4['time'].split(" ")[1]) ?? 'N/A',
                    degree: '23', //'${hour4['temp_c']}'
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

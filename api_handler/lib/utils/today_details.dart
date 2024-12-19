import 'dart:ui';

import 'package:flutter/material.dart';

class TodayDetails extends StatefulWidget {
  const TodayDetails({
    super.key,
  });

  @override
  State<TodayDetails> createState() => _TodayDetailsState();
}

class _TodayDetailsState extends State<TodayDetails> {
  String currMaxTemp = "30",
      currClimate = "clouds",
      currHumidity = "21",
      currLastUpdated = "",
      currMinTemp = "20",
      currTemp = "22",
      currUv = "10",
      currWindspeed = "23";

  String currdate = "", currtime = "", currmonth = "";

  @override
  void initState() {
    super.initState();
    // fetchWeather();
    getDateAndTime();
  }

  int currHour = DateTime.now().hour;

  // void fetchWeather() async {
  //   Map<String, dynamic> json = await ApiService().fetchDataFromWeatherAPI();
  //   // print(json);
  //   CurrentWeather weather = CurrentWeather.fromJson(json);
  //   setState(() {
  //     currMaxTemp = weather.maxTemp.toString();
  //     currClimate = weather.climate;
  //     currHumidity = weather.humidity.toString();
  //     currLastUpdated = weather.lastUpdated;
  //     currMinTemp = weather.minTemp.toString();
  //     currTemp = weather.temp.toString();
  //     currUv = weather.uv.toString();
  //     currWindspeed = weather.windSpeed.toString();
  //   });
  //   print(currClimate);
  // }

  void getDateAndTime() {
    DateTime dt = DateTime.now();
    List<String> month = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    setState(() {
      currmonth = month[dt.month - 1];
      currdate = (dt.day < 10 ? "0${dt.day}" : dt.day.toString());
      currtime =
          '${(dt.hour < 10 ? "0${dt.hour}" : dt.hour.toString())}:${(dt.minute < 10 ? "0${dt.minute}" : dt.minute.toString())}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today, $currmonth $currdate, $currtime',
                    style: TextStyle(
                        color: currHour < 6 || currHour > 18
                            ? Colors.white
                            : Colors.black)),
                RichText(
                  text: TextSpan(
                      text: currTemp,
                      style: TextStyle(
                          color: currHour < 6 || currHour > 18
                              ? Colors.white.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8),
                          fontSize: 150,
                          fontWeight: FontWeight.bold),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.top,
                          child: Text(
                            '°c',
                            style: TextStyle(
                              fontSize: 40,
                              color: currHour < 6 || currHour > 18
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: currHour < 6 || currHour > 18
                          ? Colors.white.withOpacity(0.2)
                          : Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_upward,
                                color: Colors.grey.shade400),
                            Text('$currMaxTemp°',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        SizedBox(width: 15),
                        Row(
                          children: [
                            Icon(Icons.arrow_downward,
                                color: Colors.grey.shade400),
                            Text('$currMinTemp°',
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Row(
                children: [
                  SizedBox(
                      height: 20,
                      child: Image.asset(
                          'images/${currClimate == "Sunny" ? 'sun' : currClimate == "Mist" ? 'haze' : currClimate == "Clear" || currClimate == "Cloudy" ? 'clouds' : currClimate == "Patchy rain nearby" || currClimate == "Rainy" ? 'rain' : currClimate.contains("Partly") ? 'partlycloud' : currClimate == "Thunder" ? 'thunder' : 'wind'}.png')),
                  SizedBox(width: 10),
                  Text(
                    currClimate,
                    style: TextStyle(
                        fontSize: 15,
                        color: currHour < 6 || currHour > 18
                            ? Colors.white
                            : Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: currHour < 6 || currHour > 18
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.black.withOpacity(0.5)),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
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
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ]),
                    Text('Wind Speed',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
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
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ]),
                    Text('Humidity',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  children: [
                    Row(children: [
                      SizedBox(height: 30, child: Image.asset('images/uv.png')),
                      SizedBox(width: 5),
                      Text(currUv,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                    ]),
                    Text('UV',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

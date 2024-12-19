import 'package:flutter/material.dart';

class DayCard extends StatefulWidget {
  final int day;
  const DayCard(
      {super.key,
      required this.devHeight,
      required this.onPress,
      required this.day});

  final double devHeight;
  final Function() onPress;

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  String currMaxTemp = "", currClimate = "", currdate = "", currMinTemp = "";

  // @override
  // void initState() {
  //   super.initState();
  //   fetchForecastWeather();
  // }

  // fetchForecastWeather() async {
  //   Map<String, dynamic> json = await ApiService().fetchDataFromWeatherAPI();
  //   ForecastWeather weather = ForecastWeather.fromJson(json, widget.day);
  //   setState(() {
  //     currMaxTemp = weather.maxTemp.toString();
  //     currClimate = weather.climate;
  //     currdate = weather.date;
  //     currMinTemp = weather.minTemp.toString();
  //     print(currClimate + "...");
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
                            : 'wind';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onPress,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: widget.devHeight * 0.045,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                          'images/${getImage(currClimate: currClimate)}.png'),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                          widget.day == 1
                              ? 'Tomorrow'
                              : currdate.split('-').reversed.join('-'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(currClimate,
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 10)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.grey.shade400),
                      Text('$currMaxTemp°')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_downward, color: Colors.grey.shade400),
                      Text('$currMinTemp°')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

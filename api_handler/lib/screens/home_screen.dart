import 'package:api_handler/utils/day_card.dart';
import 'package:api_handler/utils/day_details.dart';
import 'package:api_handler/utils/rounded_image.dart';
import 'package:api_handler/utils/today_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double devHeight = 0.0, devWidth = 0.0;
  List<bool> isExpanded = [false, false, false, false, false, false, false];

  Map<String, dynamic> hour1 = {}, hour2 = {}, hour3 = {}, hour4 = {};
  String currClimate = "";
  int currHour = DateTime.now().hour;
  // @override
  // void initState() {
  //   super.initState();
  //   fetchWeather();
  // }

  // void fetchWeather() async {
  //   Map<String, dynamic> json = await ApiService().fetchDataFromWeatherAPI();
  //   // print(json);
  //   CurrentWeather weather = CurrentWeather.fromJson(json);
  //   setState(() {
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
                : currClimate == "Patchy rain nearby" || currClimate == "Rainy"
                    ? 'rain'
                    : currClimate.contains("Partly")
                        ? 'partlycloud'
                        : currClimate == "Thunder"
                            ? 'thunder'
                            : 'wind';
  }

  @override
  Widget build(BuildContext context) {
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: devHeight,
          width: devWidth,
          child: Image.asset(
            currHour < 6 || currHour > 18
                // isRegister==false
                ? 'images/night.png'
                : 'images/morning.png',
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: devHeight * 0.6,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: currHour < 6 || currHour > 18
                                ? Colors.white
                                : Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text('Chennai, India',
                              style: TextStyle(
                                  color: currHour < 6 || currHour > 18
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20))
                        ],
                      ),
                      IconButton(
                          onPressed: () async {
                            print('tapped');
                          },
                          icon: Icon(Icons.menu,
                              color: currHour < 6 || currHour > 18
                                  ? Colors.white
                                  : Colors.black,
                              size: 30))
                    ],
                  ),
                  SizedBox(height: 40),
                  TodayDetails(),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: devHeight * 0.02),
                      Align(
                        alignment: Alignment.topCenter,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 3, maxWidth: 35),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: devHeight * 0.03),
                      Text('Hourly Forecast',
                          textScaler: TextScaler.linear(1.0),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: devHeight * 0.04),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedImage(
                                devHeight: devHeight,
                                climate: getImage(
                                    currClimate:
                                        'sun'), //getImage(currClimate: currClimate),
                                time:
                                    '8.00', //(hour1['time'].split(" ")[1]) ?? 'N/A',
                                degree: '29' //'${hour1['temp_c']}'
                                ),
                            RoundedImage(
                              devHeight: devHeight,
                              climate: getImage(
                                  currClimate:
                                      'sun'), //getImage(currClimate: currClimate),
                              time:
                                  '9.00', //(hour2['time'].split(" ")[1]) ?? 'N/A',
                              degree: '19', //'${hour2['temp_c']}'
                            ),
                            RoundedImage(
                              devHeight: devHeight,
                              climate: getImage(
                                  currClimate:
                                      'sun'), //getImage(currClimate: currClimate),
                              time:
                                  '10.00', //(hour3['time'].split(" ")[1]) ?? 'N/A',
                              degree: '20', //'${hour3['temp_c']}'
                            ),
                            RoundedImage(
                              devHeight: devHeight,
                              climate: getImage(
                                  currClimate:
                                      'sun'), //getImage(currClimate: currClimate),
                              time:
                                  '11.00', // (hour4['time'].split(" ")[1]) ?? 'N/A',
                              degree: '21', //'${hour4['temp_c']}'
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: devHeight * 0.03),
                      Text('Next 5 Days',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: devHeight * 0.02),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: devWidth * 0.005),
                        child: Column(
                          children: [
                            //Tomorrow
                            DayCard(
                                devHeight: devHeight,
                                onPress: () {
                                  setState(() {
                                    isExpanded[0] = !isExpanded[0];
                                  });
                                },
                                day: 1),
                            DayDetailsCard(
                                isExpanded: isExpanded[0],
                                devHeight: devHeight,
                                day: 1),
                            SizedBox(height: 20),
                            //Day 2
                            DayCard(
                                devHeight: devHeight,
                                onPress: () {
                                  setState(() {
                                    isExpanded[1] = !isExpanded[1];
                                  });
                                },
                                day: 2),
                            DayDetailsCard(
                                isExpanded: isExpanded[1],
                                devHeight: devHeight,
                                day: 2),
                            SizedBox(height: 20),
                            //Day 3
                            DayCard(
                                devHeight: devHeight,
                                onPress: () {
                                  setState(() {
                                    isExpanded[2] = !isExpanded[2];
                                  });
                                },
                                day: 3),
                            DayDetailsCard(
                                isExpanded: isExpanded[2],
                                devHeight: devHeight,
                                day: 3),
                            SizedBox(height: 20),
                            // Day 4
                            DayCard(
                                devHeight: devHeight,
                                onPress: () {
                                  setState(() {
                                    isExpanded[3] = !isExpanded[3];
                                  });
                                },
                                day: 4),
                            DayDetailsCard(
                                isExpanded: isExpanded[3],
                                devHeight: devHeight,
                                day: 4),
                            SizedBox(height: 20),
                            // Day 5
                            DayCard(
                                devHeight: devHeight,
                                onPress: () {
                                  setState(() {
                                    isExpanded[4] = !isExpanded[4];
                                  });
                                },
                                day: 5),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_Info.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/secreat.dart';
import 'package:provider/provider.dart';
import 'main.dart';

//
class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  // double temp = 0;
  // bool isLoading = false;

  // //
  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentWeather();
  // }

  //
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    String cityName = 'Nigeria';
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$weatherAPiKey',
        ),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw "An Unexpected Error Occured";
      }
      return data;
      // temp = data['list'][0]['main']['temp'];
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
          ),
          IconButton(
            onPressed: () {
              //local state management
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh),
          )
          // InkWell(
          //   onTap: () {},
          //   child: const Icon(
          //     Icons.refresh,
          //   ),
          // )
          // GestureDetector(
          //   onTap: () {},
          //   child: const Icon(
          //     Icons.refresh,
          //   ),
          // )
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final presure = currentWeatherData["main"]["pressure"];
          final windSpeed = currentWeatherData["wind"]["speed"];
          final humidity = currentWeatherData["main"]["humidity"];
          //
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main Card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: const Color.fromARGB(255, 105, 104, 104),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp K',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Icon(
                                currentSky == "Clouds" || currentSky == "Rain"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 70,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '$currentSky',
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // we could use align widge and wrap on the widget we wanna align or we use th column alignment
                const Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int i = 0; i < 10; i++)
                //         CardForcast(
                //           time: ['dt'].toString(),
                //           icon: data['list'][i + 1]['weather'][0]['main'] ==
                //                       'Clouds' ||
                //                   data['list'][i + 1]['weather'][0]['main'] ==
                //                       'Rain'
                //               ? Icons.cloud
                //               : Icons.sunny,
                //           temprature:
                //               data['list'][i + 1]['main']['temp'].toString(),
                //         ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final hourlyForecast = data['list'][index + 1];
                      final time = DateTime.parse(hourlyForecast['dt_txt']);
                      return CardForcast(
                        time: DateFormat.Hm().format(time),
                        icon: hourlyForecast['weather'][0]['main'] ==
                                    'Clouds' ||
                                hourlyForecast['weather'][0]['main'] == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                        temprature: hourlyForecast['main']['temp'].toString(),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AdditionalInfo(
                        icon: Icons.water_drop,
                        text: 'Humidity',
                        value: humidity.toString(),
                      ),
                      AdditionalInfo(
                        icon: Icons.wind_power,
                        text: 'Wind Speed',
                        value: windSpeed.toString(),
                      ),
                      AdditionalInfo(
                        icon: Icons.beach_access,
                        text: 'Pressure',
                        value: presure.toString(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class CardForcast extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temprature;

  const CardForcast({
    super.key,
    required this.icon,
    required this.time,
    required this.temprature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              temprature,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/utils/custom_colors.dart';

class DailyWeatherWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyWeatherWidget({required this.weatherDataDaily, super.key});

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next Days Weather",
              style:
                  TextStyle(color: CustomColors.textColorBlack, fontSize: 17),
            ),
          ),
          dailyList()
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        getDay(weatherDataDaily.daily[index].dt),
                        style: TextStyle(
                          color: CustomColors.textColorBlack,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                          "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                    ),
                    Text(
                      "${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°",
                    ),

                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/widgets/comfort_level.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/daily_weather_widget.dart';
import 'package:weather_app/widgets/hourly_weather_widget.dart';
import 'package:weather_app/widgets/splash_screen.dart';

import '../widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: SplashScreen(), //CircularProgressIndicator(),
              )
            : Container(
          decoration: BoxDecoration(
            color: Colors.grey[50]
          ),
              child: Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      HeaderWidget(),
                      CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getWeatherData().getCurrentWeather(),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      HourlyWeatherWidget(
                        weatherDataHourly:
                            globalController.getWeatherData().getHourlyWeather(),
                      ),
                      DailyWeatherWidget(
                        weatherDataDaily:
                            globalController.getWeatherData().getDailyWeather(),
                      ),
                      Container(
                        height: 1,
                        color: CustomColors.dividerLine,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ComfortLevel(weatherDataCurrent: globalController.getWeatherData().getCurrentWeather(),)
                    ],
                  ),
                ),
            )),
      ),
    );
  }
}

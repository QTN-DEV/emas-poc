import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main_app/services/openweathermap.dart';
import 'package:weather/weather.dart';

class BruneiWXHomeCard extends StatefulWidget {
  const BruneiWXHomeCard({super.key});

  @override
  State<StatefulWidget> createState() => BruneiWXHomeCardState();
}

class BruneiWXHomeCardState extends State<BruneiWXHomeCard> {
  OpenWeatherMapService weatherService = OpenWeatherMapService();
  Weather? weatherData;

  @override
  Widget build(BuildContext context) {
    ThemeData mainTheme = Theme.of(context);
    ThemeData theme = mainTheme.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: mainTheme.brightness,
      ),
    );
    return Container(
      color: theme.colorScheme.primaryContainer,
      width: double.infinity,
      height: 200,
      child: SafeArea(
        bottom: false,
        minimum: const EdgeInsets.all(16),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.vertical,
          spacing: 8,
          children: [
            if (weatherData == null) Text(
              "Loading Weather...",
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimaryContainer),
            ),
            if (weatherData?.areaName != null && weatherData!.areaName!.isNotEmpty) Text(
              weatherData!.areaName!,
              style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer),
            ),
            if (weatherData != null) Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              children: [
                if (weatherData?.weatherIcon != null && weatherData!.weatherIcon!.isNotEmpty) CircleAvatar(
                  backgroundColor: theme.colorScheme.primary.withOpacity(theme.brightness == Brightness.light ? 0.2 : 0.8),
                  radius: 32,
                  child: Image.network(
                    "https://openweathermap.org/img/wn/${weatherData?.weatherIcon}@2x.png",
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (weatherData?.temperature?.celsius != null) Text(
                      "${weatherData!.temperature!.celsius!.toStringAsFixed(1)}°C",
                      style: theme.textTheme.displayMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                    ),
                    if (weatherData?.weatherDescription != null) Text(
                      toBeginningOfSentenceCase(weatherData!.weatherDescription!),
                      style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                    ),
                  ],
                ),
              ],
            ), 
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    weatherService.loadWeatherData().then((weather) {
      setState(() {
        weatherData = weather;
      });
    });
  }
}
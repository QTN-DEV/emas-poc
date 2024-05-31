import 'package:flutter_cache/flutter_cache.dart' as cache;
import 'package:weather/weather.dart';

class OpenWeatherMapService {
  WeatherFactory wf = WeatherFactory("d8ba55264dce06a3f80e560c149ec418", language: Language.INDONESIAN);

  Future<Weather> loadWeatherData() async {
    Map<String, dynamic>? rawData = await cache.load("owm_brunei");
    Weather? data;
    if (rawData == null) {
      data = await wf.currentWeatherByCityName("Bandar Seri Begawan");
      cache.remember("owm_brunei", data.toJson(), 30 * 60);
    } else {
      data = Weather(rawData);
    }
    return data;
  }
}
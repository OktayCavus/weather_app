import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_doing_myself/model/weather_model.dart';

class DataService{
  Future<WeatherModel?> getWeather(String cityName) async{
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    //var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}');
    final queryParameters = {'q' : cityName ,
    'appid' : 'f15ea6f418ac5069219e000d61ed9a4e' ,
    'units': 'metric'};

    final url = Uri.https('api.openweathermap.org',
    '/data/2.5/weather' ,
      queryParameters);

    final response = await http.get(url);

    final body = json.decode(response.body);

    return WeatherModel.fromJson(body);
  }

  var apiKey = 'f7d67ae067d1fe5ca946f16311ab86b7';
  Future <WeatherModel> getData(var latitude , var longitude)async{
    var uriCall = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var response =await http.get(uriCall);
    var body = jsonDecode(response.body);
    return WeatherModel.fromJson(body);
  }
}
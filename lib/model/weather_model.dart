// ignore_for_file: public_member_api_docs, sort_constructors_first

/*{

  "weather": [
    {
      "id": 803,
      "main": "Clouds",
      "description": "broken clouds",
      "icon": "04d"
    }
  ],
  "main": {
    "temp": 16.01,

  },
  "name": "Kayseri Province"
}*/


import 'package:flutter/widgets.dart';

class WeatherModel {
  String? cityName;
  double? temp;
  String? description;
  double? lat;
  double? lon;
  int? id;
  WeatherModel({
    this.cityName,
    this.temp,
    this.description,
    this.lat,
    this.lon,
    this.id
  });

  WeatherModel.fromJson(Map<String , dynamic> json){
    cityName = json['name'];
    temp = json['main']['temp'];
    description = json['weather'][0]['description'];
    lat = json['coord']['lat'];
    lon = json['coord']['lon'];
    id = json['weather'][0]['id'];

  }

  }




// ignore_for_file: public_member_api_docs, sort_constructors_first


/*{
  "weather": [
    {
      "id": 501,
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48
  },
  "name": "Zocca",
}   */


import 'package:flutter/widgets.dart';

class WeatherModel {
  String? cityName;
  double? temp;
  String? description;
  Icon? icon;
  WeatherModel({
    this.cityName,
    this.temp,
    this.description,
    this.icon
  });

  WeatherModel.fromJson(Map<String , dynamic> json){
    cityName = json['name'];
    temp = json['main']['temp'];
    description = json['weather'][0]['description'];
    icon = json['weather'][0]['icon'];
  }
/*     Map <String , dynamic > toJson(){
      final Map<String , dynamic> data = Map <String , dynamic>();
      data['cityName'] = cityName;
      return data;
    } */
  }
  



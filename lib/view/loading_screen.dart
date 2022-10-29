import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_doing_myself/view/home.dart';
import 'package:weather_app_doing_myself/service/service.dart';
import 'package:weather_app_doing_myself/location/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  var client = DataService();
  static var data;
  info () async{

  var position = await LocationFinder().determinePosition();
  data = await client.getData(position.latitude , position.longitude);
  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
  return data;

  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff005C97),
      body: FutureBuilder(
        future: info(),
        builder: (context, snapshot){return SpinKitCircle(color: Colors.white,duration: Duration(milliseconds: 1200),);},
        ),
        );
  }
}
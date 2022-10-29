import 'package:flutter/material.dart';
import 'package:weather_app_doing_myself/view/home.dart';
import 'package:weather_app_doing_myself/view/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen()
    );
  }
}

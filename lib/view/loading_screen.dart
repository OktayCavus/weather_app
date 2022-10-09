import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff005C97),
      body: SpinKitCircle(color: Colors.white,
      duration: Duration(milliseconds: 1200),

      ),
    );
  }
}
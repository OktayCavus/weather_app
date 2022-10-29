import 'package:flutter/material.dart';
import 'package:weather_app_doing_myself/model/weather_model.dart';
import 'package:weather_app_doing_myself/service/service.dart';
import 'package:weather_app_doing_myself/location/location.dart';
import 'package:weather_app_doing_myself/view/loading_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  // lat lon için servise WeatherData
  var client = DataService();

  // var data;

  // info () async{
    // var position = await LocationFinder().determinePosition();
    // data = await client.getData(position.latitude , position.longitude);
    // return data;
  // }
  var data=LoadingScreenState.data;

  bool isActive  = false;
  bool isHiding = true;

  final _textController = TextEditingController();
  WeatherModel? _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff005C97),
      body: FutureBuilder(
        // future: info(),
        builder: (context, snapshot) {
          return SingleChildScrollView( //b68dd358b98645fd8b   5c32a7cacb7b6cf6a6
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon:const Icon(Icons.menu),iconSize: 35,
                        onPressed: (){},),
                        IconButton(onPressed: (){
                          setState(() {
                            isActive = !isActive;
                          });
                        },
                        icon:const Icon(Icons.search),
                        iconSize: 30,)
                    ],
                  ),
                  isActive ? TextField(
                    onTap: (){
                      setState(() {
                        isHiding = !isHiding;
                      });
                    },
                    style:const TextStyle(fontSize: 25,color: Colors.white),
                    controller: _textController,
                    decoration: InputDecoration(suffixIcon: IconButton(onPressed: (){
                      _search();
                    }, icon:const Icon(Icons.search,color: Colors.white,),),hintText: 'Enter City Name',labelText: 'City',
                    border: InputBorder.none,
                    labelStyle:const TextStyle(color: Colors.white,fontSize: 20),
                    ),
                    textAlign: TextAlign.center,
                  ) : const SizedBox(),
                  Center(
                    child:
                    _response != null ? Text('${_response!.cityName}',
                          style: const TextStyle(
                            fontSize:37,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            )): Text('${data?.cityName}',
                          style: const TextStyle(
                            fontSize:35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,),)
                  ),
                  const SizedBox(height: 5,),
                  buildButton('Turn on location services',(){}),
                  const SizedBox(height: 20,),
                  _response != null ? Text('${_response!.temp}',
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 130,
                    fontWeight: FontWeight.bold
                    ),): Text('${data?.temp}°',
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 130,
                    fontWeight: FontWeight.bold
                    ),),
                    _response != null ? Text('${_response!.description}',
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                      ),): Text('${data?.description}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(height: 20,),
                      buildButton('AQI 14',(){}),
                      Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:const [
                                Text('More Details >')
                              ],
                            ),
                            const SizedBox(height: 10,),
                            buildForecast(Icons.thunderstorm, 'Today • Thunderstorm','29º / 25º'),
                            const SizedBox(height: 20,),
                            buildForecast(Icons.cloud_rounded, 'Tommorow • Cloudy','30º / 25º'),
                            const SizedBox(height: 20,),
                            buildForecast(Icons.thunderstorm, 'Fri • Thunderstorm','25º / 20º'),
                            const SizedBox(height: 20,),
                            buildButton('5-day forecast',(){})
                          ],
                        ),
                      )
                ],
              ),
            ),
          );
  },),
    );
  }

  void _search() async {
    final response =await client.getWeather(_textController.text);
    setState(() {
      _response = response;
    });
  }

  Row buildForecast(IconData icon , String text , String degree) {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Icon(icon,color: Colors.white),
                        Text(text,style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                        Text(degree,style:const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),)
                      ],);
  }

  GestureDetector buildButton(String text, Function onPressed) {
    return GestureDetector(
      onTap: onPressed(),
      child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal:30),
              decoration: BoxDecoration(color:const Color(0xffFFB200),borderRadius: BorderRadius.circular(20)),
              child:  Text(text,style:const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:climaapp/services/weather.dart';
import 'package:climaapp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climaapp/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  void getLocationData()async {
    //WeatherModel weatherModel;
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return  LocationScreen(locationWeather: weatherData);
    }));
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          )
      ),
    );
  }
}



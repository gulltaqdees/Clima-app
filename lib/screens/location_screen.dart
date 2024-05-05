import 'package:climaapp/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climaapp/utilities/constants.dart';
//import 'package:climaapp/services/weather.dart';

class LocationScreen extends StatefulWidget {
  //const LocationScreen({Key? key}) : super(key: key);
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature = 0;
  String weatherIcon = '';
  String cityName = '';
  String weatherMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if(weatherData == null){
        temperature = 0;
       weatherIcon = 'ERROR';
       weatherMessage = 'Unable to get the weather';
       cityName='';
       return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      int condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherMessage = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('images/location_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop))),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text('$temperature°', style: kTempTextStyle)),
                    Expanded(
                      child: Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    '$weatherMessage in $cityName',
                    style: kMessageTextStyle,
                    textAlign: TextAlign.right,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

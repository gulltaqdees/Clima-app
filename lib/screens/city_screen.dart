import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/city_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop)),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 40.0,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Enter City Name',
                  fillColor: Colors.white,
                  //icon:
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_paradise/screens/choice_dashboard.dart';
import 'package:pet_paradise/screens/main_dashboard.dart';
import 'package:pet_paradise/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
    Timer(Duration(seconds: 3) , (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>MainDashboard()));
    });
  }
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      body:Center(
        child: Image(image: AssetImage("assets/images/logo_with_text.png"),),
      ),
    );
  }
}

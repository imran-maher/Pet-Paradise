import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:pet_paradise/pages/main_dashboard_page.dart';
import 'package:pet_paradise/utils/size_config.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => MainDashboardPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo_with_text.png"),
        ),
      ),
    );
  }
}

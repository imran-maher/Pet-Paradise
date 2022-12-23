import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:pet_paradise/utils/size_config.dart';

import 'choice_page.dart';

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
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return ChoicePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    MyAppSize.config(data);
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo_with_text.png"),
        ),
      ),
    );
  }
}


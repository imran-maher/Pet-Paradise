import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_paradise/module/get_started_page_data.dart';
import 'package:pet_paradise/pages/get_started.dart';
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
          builder: (BuildContext context) => GetStartedPage(
                pageData: GetStartedPageData(
                  pageTitle: "Blogs & Articles",
                  subTitle: "Publish Your Own  Passion In Your Own Way",
                  imgUrl:
                      "https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                ),
              )));
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

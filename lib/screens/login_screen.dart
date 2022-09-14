import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';

import '../utils/size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
        body: Responsive(
      mobile: mobile(context),
      tablet: tablet(context),
      web: web(context),
    ));
  }
}

//TODO : Mobile
Widget mobile(BuildContext) {
  return Padding(
    padding: EdgeInsets.only(
        left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
            height: 163,
            width: 135,
            image: AssetImage("assets/images/logo.png")),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(hintText: "Email" , ),keyboardType: TextInputType.emailAddress,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(hintText: "Password" , ),keyboardType: TextInputType.text,obscureText: true,),
        SizedBox(height: 20,),
      ],
    ),
  );
}

//TODO : Tablet
Widget tablet(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}

//TODO : Web
Widget web(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}

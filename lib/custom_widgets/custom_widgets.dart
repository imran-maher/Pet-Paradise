//TODO: My Custom Button For Dashboards

//TODO : My Custom Button Widget
import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/size_config.dart';

import '../utils/colors.dart';

Widget MyButton(
    {required void onPressed()?,
    required String title,
    required Color color,
    required Color textColor}) {
  return Container(
    height: 55,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
    child: MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      splashColor: MyColors.DARK_GREEN,
      child: Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

//TODO : InputDecoration for Login and Sign up TextFields
InputDecoration textFieldDecoration(
    {required String hint, required IconData icon}) {
  return InputDecoration(

    hintText: hint,
    prefixIcon: Icon(icon),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

//TODO : Login and SignUp Button
Widget loginAndSignUpButton(
    {required Function  onPressed, required String title}) {
  return MaterialButton(
    onPressed: onPressed(),
    textColor: Colors.black,
    minWidth: 139,
    height: 39,
    child: Text(title),
    color: MyColors.LIGHT_GREEN,
  );
}

//TODO : Main Dashboard Card

Widget dashboardCard({required Function onTap , required String logoImgPath , required String title}){
  return GestureDetector(onTap: onTap(),
    child: Container(
      height: 250,
      width: MyAppSize.width! * 44,
      child: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                Image(image: AssetImage(logoImgPath)),
            Text(title),
        ],),
      ),
    ),
  );
}



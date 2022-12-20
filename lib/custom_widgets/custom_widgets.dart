//TODO: My Custom Button For Dashboards

//TODO : My Custom Button Widget
import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/size_config.dart';

import '../utils/colors.dart';

Widget MyButton(
    {required void onPressed()?,
    required String title,
    required Color color,
    required Color textColor,
    double? fontSize,
    Color? splashColor,
    double? height,
double? borderRadius}) {
  return Container(
    height: height == null ? 48 : height,
    child: MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius==null ? 10 : borderRadius)),
      color: color,
      splashColor: splashColor == null ? MyColors.DARK_GREEN : splashColor,
      child: Text(
        title,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize == null ? 18 : fontSize,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}

//TODO : InputDecoration for Login and Sign up TextFields
InputDecoration textFieldDecoration(
    {required String hint,  IconData? icon , double? borderRadius}) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Icon(icon),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius == null ? 5 : borderRadius),
    ),
  );
}

//TODO : Login and SignUp Button
Widget loginAndSignUpButton(
    {required Function onPressed, required String title}) {
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

Widget dashboardCard(
    {required Function onTap,
    required String logoImgPath,
    required String title}) {
  return GestureDetector(
    onTap: onTap(),
    child: Container(
      height: 250,
      width: MyAppSize.width! * 44,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage(logoImgPath)),
            Text(title),
          ],
        ),
      ),
    ),
  );
}

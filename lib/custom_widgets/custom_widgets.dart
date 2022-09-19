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

//TODO : MainDashboard Card

Widget mainDashboardCard(
    {required onTap, required String imgPath, required String title}) {
  return InkWell(
    onTap: onTap(),
    splashColor: Colors.green,
    child: Ink(
      height: 200,
      width: MyAppSize.width! * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(blurRadius: 2,color: MyColors.LIGHT_GREEN,spreadRadius: 0.2,offset: Offset(0, 5))]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image(image: AssetImage(imgPath)),
            flex: 4,
          ),
          Expanded(
            child: Text(title,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center),
            flex: 1,
          ),
        ],
      ),
    ),
  );
}

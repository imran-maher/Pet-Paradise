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
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius == null ? 10 : borderRadius)),
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

/// InputDecoration for Login and Sign up TextFields
InputDecoration textFieldDecorationWithIcon(
    {required String hint, IconData? icon, double? borderRadius}) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Icon(icon),
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(borderRadius == null ? 5 : borderRadius),
    ),
  );
}
/// InputDecoration for Login and Sign up TextFields
InputDecoration textFieldDecorationWithOutIcon(
    {required String hint, double? borderRadius}) {
  return InputDecoration(
    hintText: hint,
    counter: Offstage(),
    border: OutlineInputBorder(
      borderRadius:
      BorderRadius.circular(borderRadius == null ? 5 : borderRadius),
    ),
  );
}

///Login and SignUp Button
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

/// Main Dashboard Card

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

///Background Widget
Widget backgroundWidget() {
  return Container(
    width: MyAppSize.width,
    child: Image(
      image: AssetImage("assets/images/rectDesign.png"),
      alignment: Alignment.topRight,
    ),
  );
}

/// MyAppBar with TransparentBackground
AppBar transparentAppBar({required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back,
        color: MyColors.LIGHT_GREEN,
      ),
    ),
  );
}

/// Right and Left Padding for All Pages
Padding leftAndRightPadding({required Widget child}) {
  return Padding(
    padding: EdgeInsets.only(
        right: MyAppSize.width! * 0.05, left: MyAppSize.width! * 0.05),
    child: child,
  );
}

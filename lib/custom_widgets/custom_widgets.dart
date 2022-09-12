//TODO: My Custom Button For Dashboards

//TODO : My Custom Button Widget
import 'package:flutter/material.dart';

import '../utils/colors.dart';

Widget MyButton({required  void onPressed()?, required String title ,required Color color,required Color textColor}) {
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
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}

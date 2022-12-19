import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/size_config.dart';

Dialog CustomProgressIndicatorDialog(
    {required BuildContext context, required String msg}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    child: Container(
      height: MyAppSize.height! * 0.5,
      width: MyAppSize.width! * 0.8,
      child: Text(msg),
    ),
  );
}

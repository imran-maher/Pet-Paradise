import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/size_config.dart';

void CustomProgressIndicatorDialog(
    {required BuildContext context}) {
  showDialog(context: context, builder: (context){
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
      child: Container(
        height: MyAppSize.height,
        width: MyAppSize.width,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  });

}

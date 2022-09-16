import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/size_config.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyAppSize.height,
      width: MyAppSize.width,

    );
  }
}

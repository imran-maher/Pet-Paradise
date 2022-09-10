import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/size_config.dart';

class Responsive extends StatelessWidget {
  /**
   * Max width for mobile is 479 px
   * more than 479 px and less than 767 px (width) will be treated as tablet
   * more than 767 px (width)  will be treated as eb or desktop
   **/


  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const Responsive(
      {Key? key, required this.mobile, required this.tablet, required this.web})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MyAppSize.width! <= 479) {
      return mobile;
    } else if (MyAppSize.width! > 479 && MyAppSize.width! <= 767) {
      return tablet;
    } else {
      return web;
    }
  }
}

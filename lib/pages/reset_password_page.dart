import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/utils/size_config.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }
}

//UI For Confirm Email
//TODO MOBILE
Widget mobile(BuildContext context) {
  return Stack(
    alignment: Alignment.topLeft,
    children: [
      Image(
        image: AssetImage("assets/images/rectDesign.png"),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [],
        ),
      )
    ],
  );
}

// TODO WEB
Widget web(BuildContext context) {
  return Container(
    child: Center(
      child: Text("Design under-Processing"),
    ),
  );
}

// TODO TABLET
Widget tablet(BuildContext context) {
  return Container(
    child: Center(
      child: Text("Design under-Processing"),
    ),
  );
}

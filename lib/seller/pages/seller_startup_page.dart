import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';

import '../../custom_widgets/custom_widgets.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';

String dropDownValue = "English";
double buttonSpace = 10;

class SellerStartupPage extends StatefulWidget {
  const SellerStartupPage({Key? key}) : super(key: key);

  @override
  State<SellerStartupPage> createState() => _SellerStartupPageState();
}

class _SellerStartupPageState extends State<SellerStartupPage> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      body: Responsive(
        mobile: mobile(context),
        web: web(context),
        tablet: tablet(context),
      ),
    );
  }
}

//TODO : Mobile UI
Widget mobile(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        //Top Logo
        Image(
          image: AssetImage("assets/images/logo_with_text.png"),
          height: 280,
          width: MyAppSize.width,
        ),
        //TODO : Pet Owner
        MyButton(
            onPressed: () {},
            title: "Registered With Mobile Number",
            color: MyColors.GREEN,
            textColor: Colors.white,
            fontSize: 13),
        SizedBox(
          height: 25,
        ),
        //TODO : Seller
        MyButton(
            onPressed: () {},
            title: "Login with Password",
            color: MyColors.LIGHT_GREEN,
            textColor: Colors.white,
            fontSize: 13),
      ],
    ),
  );
}

//TODO : Tablet UI
Widget tablet(BuildContext context) {
  return Center(child: Text("In Designing Process"));
}

//TODO : Web UI
Widget web(BuildContext context) {
  return Center(child: Text("In Designing Process"));
}

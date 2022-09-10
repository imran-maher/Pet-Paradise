import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/utils/colors.dart';

import '../utils/size_config.dart';

String dropDownValue = "English";
double buttonSpace = 20;

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
        body: Responsive(
      mobile: mobile(),
      web: Center(
        child: Text("Under Process"),
      ),
      tablet: Center(
        child: Text("Under Process"),
      ),
    ));
  }
}

//TODO : My Custom Button Widget
Widget MyButton({required Function onPressed, required String title}) {
  return Padding(
    padding: EdgeInsets.only(
        left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
    child: Container(
      height: 63,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: MyColors.LIGHT_GREEN50,
        splashColor: MyColors.DARK_GREEN,
        child: Text(
          title,
          style: TextStyle(
              color: MyColors.DARK_GREEN,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}

Widget mobile() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/backgrounds/main_dashboard_bg.png"),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 15,
        ),
        //TODO : Top Logo
        Image(
          image: AssetImage("assets/images/logo.png"),
          height: 135,
          width: 163,
        ),
        SizedBox(
          height: buttonSpace,
        ),
        //TODO : Pet Owner
        MyButton(onPressed: () {}, title: "Pet Owner"),
        SizedBox(
          height: buttonSpace,
        ),
        //TODO : Seller
        MyButton(onPressed: () {}, title: "Seller"),
        SizedBox(
          height: buttonSpace,
        ),
        //TODO: Services
        MyButton(onPressed: () {}, title: "Services"),
        SizedBox(
          height: buttonSpace,
        ),
        //TODO: Guest
        MyButton(onPressed: () {}, title: "Guest"),
        SizedBox(
          height: 70,
        ),
        GestureDetector(
          onTap: () {},
          child: Center(
            child: Text(
              "Term and Conditions",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    ),
  );
}

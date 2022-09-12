import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/utils/colors.dart';

import '../custom_widgets/custom_widgets.dart';
import '../utils/size_config.dart';

class ServicesDashboard extends StatefulWidget {
  const ServicesDashboard({Key? key}) : super(key: key);

  @override
  State<ServicesDashboard> createState() => _ServicesDashboardState();
}

class _ServicesDashboardState extends State<ServicesDashboard> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image:
              AssetImage("assets/images/backgrounds/services_dashboard_bg.png"),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
        child: Responsive(
          mobile: mobile(context),
          tablet: tablet(context),
          web: web(context),
        ),
      ),
    );
  }
}

//TODO : Mobile UI

Widget mobile(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SizedBox(
        height: 30,
      ),
      //TODO : Logo image
      Image(
        image: AssetImage("assets/images/logo.png"),
        width: 127,
        height: 98,
      ),
      SizedBox(
        height: 5,
      ),
      //TODO : User name
      Container(
        alignment: Alignment.center,
        width: MyAppSize.width,
        child: Text(
          "Hello Imran",
          style: TextStyle(
            fontSize: 17,
            color: MyColors.DARK_GREEN,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      //TODO : First Row For Veterinarians Button and Breeder Button
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MyAppSize.width! * 0.425,
              child: MyButton(
                onPressed: () {},
                title: "Veterinarians",
                color: MyColors.LIGHT_GREEN,
                textColor: Colors.black,
              )),
          Container(
              width: MyAppSize.width! * 0.425,
              child: MyButton(
                onPressed: () {},
                title: "Breeders",
                color: MyColors.LIGHT_GREEN,
                textColor: Colors.black,
              )),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      //TODO : Second Row For Trainers Button and Pet Store Button
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MyAppSize.width! * 0.425,
              child: MyButton(
                onPressed: () {},
                title: "Veterinarians",
                color: MyColors.LIGHT_GREEN,
                textColor: Colors.black,
              )),
          Container(
              width: MyAppSize.width! * 0.425,
              child: MyButton(
                onPressed: () {},
                title: "Breeders",
                color: MyColors.LIGHT_GREEN,
                textColor: Colors.black,
              )),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      //TODO : Third Row For Blogs snd Articles Button and Adopt a Pet  Button
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MyAppSize.width! * 0.425,
              child: MyButton(
                onPressed: () {},
                title: "Blogs & Articles",
                color: MyColors.LIGHT_GREEN,
                textColor: Colors.black,
              )),
          Container(
            width: MyAppSize.width! * 0.425,
            child: MyButton(
              onPressed: () {},
              title: "Breeders",
              color: MyColors.LIGHT_GREEN,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    ],
  );
}

//TODO : TABLET UI
Widget tablet(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}
//TODO : Web UI
Widget web(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}

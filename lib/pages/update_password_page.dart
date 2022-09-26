import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';

import '../utils/colors.dart';
import '../utils/size_config.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: MyColors.LIGHT_GREEN,
          ),
        ),
      ),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        web: web(context),
      ),
    );
  }
}

//TODO : Mobile Ui
Widget mobile(BuildContext context) {
  return Stack(
    children: [
      Container(
        width: MyAppSize.width,
        child: Image(
          image: AssetImage("assets/images/rectDesign.png"),
          alignment: Alignment.topRight,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Reset Your Password?",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text("Enter Your New Password Below",
                style: TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.center),
            SizedBox(height: 40),
            Text("New Password",
                style: TextStyle(fontSize: 14, color: MyColors.HINT_COLOR),
                textAlign: TextAlign.start),
            SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration:
                  textFieldDecoration(hint: "", icon: Icons.lock_open_outlined),
            ),
            SizedBox(height: 25),
            Text("Confirm Password",
                style: TextStyle(fontSize: 14, color: MyColors.HINT_COLOR),
                textAlign: TextAlign.start),
            SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration:
              textFieldDecoration(hint: "", icon: Icons.lock_open_outlined),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 193,
                  height: 39,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  textColor: Colors.black,
                  child: Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  color: MyColors.LIGHT_GREEN,
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

//TODO : Tablet Ui

Widget tablet(BuildContext context) {
  return Center(
    child: Text("Designing Process"),
  );
}

//TODO : Web UI

Widget web(BuildContext context) {
  return Center(
    child: Text("Designing Process"),
  );
}

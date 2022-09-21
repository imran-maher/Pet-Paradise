import 'package:flutter/material.dart';

import '../controllers/responsive_controller.dart';
import '../custom_widgets/custom_widgets.dart';
import '../utils/colors.dart';
import '../utils/size_config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
        body: Responsive(
      mobile: mobile(context),
      tablet: tablet(context),
      web: web(context),
    ));
  }
}

//TODO : Mobile
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
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Logo Image
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                      height: 180,
                      width: 180,
                      child: Image(
                          image: AssetImage(
                        "assets/images/logo.png",
                      ))),
                ),
                //Text Descriptions
                Text(
                  "Welcome\nTo Pet Paradise~",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  " A dream-filled Paradise",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                //Login Card
                Card(
                  elevation: 5,
                  shadowColor: MyColors.LIGHT_GREEN,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MyAppSize.width! * 0.025,
                      right: MyAppSize.width! * 0.025,
                      top: 20,
                      bottom: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Sing Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //TODO : Name Field
                        Container(
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: textFieldDecoration(
                                hint: "Enter Name", icon: Icons.person),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //TODO:Email Field
                        Container(
                          height: 50,
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFieldDecoration(
                                hint: "Enter Email", icon: Icons.voicemail),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFieldDecoration(
                                hint: "Enter Password", icon: Icons.lock_open),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          child: TextField(
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFieldDecoration(
                                hint: "Re-enter Password",
                                icon: Icons.lock_open),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              minWidth: 139,
                              height: 39,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {},
                              textColor: Colors.black,
                              child: Text("Sign Up"),
                              color: MyColors.LIGHT_GREEN,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                " Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: MyColors.LIGHT_GREEN),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

//TODO : Tablet
Widget tablet(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}

//TODO : Web
Widget web(BuildContext context) {
  return Center(
    child: Text("In Designing Process"),
  );
}
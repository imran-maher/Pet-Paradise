import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/screens/signup_screen.dart';
import 'package:pet_paradise/utils/colors.dart';

import '../utils/size_config.dart';

//Text Editing Controller
TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
  }
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.arrow_back , color: MyColors.LIGHT_GREEN,),
        ),
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
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 27),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //TODO : Email Field
                      Container(
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFieldDecoration(
                              hint: "Enter Email", icon: Icons.voicemail),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //TODO:Password Field
                      Container(
                        height: 50,
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: textFieldDecoration(
                              hint: "Enter Password",
                              icon: Icons.lock_open_rounded),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //TODO: Forgot Password
                      Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: MyColors.RED),
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
                            child: Text("Login"),
                            color: MyColors.LIGHT_GREEN,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Login With",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                              image: AssetImage("assets/images/google.png"),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image(
                              image: AssetImage("assets/images/facebook.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              " SingUp",
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

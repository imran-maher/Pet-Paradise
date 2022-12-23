import '../controllers/firebase_auth_controller.dart' as firebase_auth;
import 'package:flutter/material.dart';
import '../controllers/form_validation_controller.dart';
import '../controllers/responsive_controller.dart';
import '../custom_widgets/custom_widgets.dart';
import '../utils/colors.dart';
import '../utils/size_config.dart';

//Text Editing Controller
TextEditingController signUpNameController = TextEditingController();
TextEditingController signUpEmailController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();
TextEditingController signUpRePasswordController = TextEditingController();

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //Form key and Auto Validate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
        body: Responsive(
      mobile: mobile(context),
      tablet: tablet(context),
      web: web(context),
    ));
  }

//SignUp Form UI
  Widget formUI(BuildContext context) {
    return Form(
      key: _formKey,
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
          //Name Field
          Container(
            height: 50,
            child: TextFormField(
              validator: (arg) {
                if (arg != null) {
                  MyFormValidator.validateName(name: arg);
                }
                return null;
              },
              controller: signUpNameController,
              keyboardType: TextInputType.text,
              decoration:
                  textFieldDecorationWithIcon(hint: "Enter Name", icon: Icons.person),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //E-mail Field
          Container(
            height: 50,
            child: TextFormField(
              controller: signUpEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: textFieldDecorationWithIcon(
                  hint: "Enter Email", icon: Icons.voicemail),
              validator: (arg) {
                if (arg != null) {
                  MyFormValidator.validateEmail(email: arg);
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //Password Field
          Container(
            height: 50,
            child: TextFormField(
              validator: (arg) {
                if (arg != null) {
                  MyFormValidator.validatePassword(password: arg);
                }
                return null;
              },
              controller: signUpPasswordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: textFieldDecorationWithIcon(
                  hint: "Enter Password", icon: Icons.lock_open),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //Re-Enter Password Field
          Container(
            height: 50,
            child: TextFormField(
              controller: signUpRePasswordController,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: textFieldDecorationWithIcon(
                  hint: "Re-enter Password", icon: Icons.lock_open),
              validator: (arg) {
                if (arg != null) {
                  MyFormValidator.validatePassword(password: arg);
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),

          //SignUp Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 139,
                height: 39,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  String msg = await firebase_auth.signUp(context: context,
                      email: signUpEmailController.text,
                      password: signUpPasswordController.text);
                  SnackBar snackBar = SnackBar(content: Text(msg));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
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
    );
  }

  //TODO : Mobile
  Widget mobile(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(),
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
                      child: formUI(context)),
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
}

import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/size_config.dart';

import '../../utils/colors.dart';

class SellerSignupCreatePasswordPage extends StatefulWidget {
  const SellerSignupCreatePasswordPage({Key? key}) : super(key: key);

  @override
  State<SellerSignupCreatePasswordPage> createState() =>
      _SellerSignupCreatePasswordPageState();
}

class _SellerSignupCreatePasswordPageState
    extends State<SellerSignupCreatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile: mobile(context: context),
        tablet: tablet(context: context),
        web: web(context: context),
      ),
    );
  }

  ///Mobile UI
  Widget mobile({required BuildContext context}) {
    return Stack(
      children: [
        backgroundWidget(),
        SingleChildScrollView(
          child: leftAndRightPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MyAppSize.height! * 0.2,
                ),
                Text("Cleat an Account"),
                Text("Set up a password"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  child: TextField(
                    decoration: textFieldDecorationWithOutIcon(
                      hint: "Enter Your Password",
                      borderRadius: 30,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  child: TextField(
                    decoration: textFieldDecorationWithOutIcon(
                      hint: "Confirm Password",
                      borderRadius: 30,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text("Referral Code"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  child: TextField(
                    decoration: textFieldDecorationWithOutIcon(
                      hint: "",
                      borderRadius: 30,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: MyAppSize.height! * 0.1,
                ),
                Text("Terms and Conditions"),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onPressed: () {},
                  title: "Agree & Create Account",
                  color: MyColors.LIGHT_GREEN,
                  textColor: Colors.white,
                  splashColor: MyColors.YELLOW,
                  borderRadius: 30,
                  height: 45,
                  fontSize: 13
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  ///Tablet UI
  Widget tablet({required BuildContext context}) {
    return Center(
      child: Text("Tablet UI In Design Process"),
    );
  }

  ///Web UI
  Widget web({required BuildContext context}) {
    return Center(
      child: Text("Web UI In Design Process"),
    );
  }
}

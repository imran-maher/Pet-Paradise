import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller/pages/seller_signup_create_password_page.dart';
import 'package:pet_paradise/utils/size_config.dart';

import '../../utils/colors.dart';

class SellerSignupCodeVerificationPage extends StatefulWidget {
  final String verificationCode;

  SellerSignupCodeVerificationPage({Key? key, required this.verificationCode})
      : super(key: key);

  @override
  State<SellerSignupCodeVerificationPage> createState() =>
      _SellerSignupCodeVerificationPageState();
}

class _SellerSignupCodeVerificationPageState
    extends State<SellerSignupCodeVerificationPage> {
  final TextEditingController _digitOneController = TextEditingController();
  final TextEditingController _digitTwoController = TextEditingController();
  final TextEditingController _digitThreeController = TextEditingController();
  final TextEditingController _digitFourController = TextEditingController();
  final TextEditingController _digitFiveController = TextEditingController();
  final TextEditingController _digitSixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile:
            mobile(context: context, verificationCode: widget.verificationCode),
        tablet: tablet(context: context),
        web: web(context: context),
      ),
    );
  }

  ///Mobile UI
  Widget mobile(
      {required BuildContext context, required String verificationCode}) {
    return Stack(
      children: [
        backgroundWidget(),
        leftAndRightPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MyAppSize.height! * 0.2,
                ),
                Text("Enter The  Code"),
                Text(
                    "Please Enter Verification Code Which Sent to \n$verificationCode"),
                SizedBox(
                  height: 30,
                ),

                ///Verification Code UI
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///Digit One
                    codeVerificationTextField(
                        context: context,
                        controller: _digitOneController,
                        digitNumber: 1),

                    ///Digit Two
                    codeVerificationTextField(
                        context: context,
                        controller: _digitTwoController,
                        digitNumber: 2),

                    ///Digit Three
                    codeVerificationTextField(
                        context: context,
                        controller: _digitThreeController,
                        digitNumber: 3),

                    ///Digit Four
                    codeVerificationTextField(
                        context: context,
                        controller: _digitFourController,
                        digitNumber: 4),

                    ///Digit Five
                    codeVerificationTextField(
                        context: context,
                        controller: _digitFiveController,
                        digitNumber: 5),

                    ///Digit Six
                    codeVerificationTextField(
                        context: context,
                        controller: _digitSixController,
                        digitNumber: 6),
                  ],
                ),
                SizedBox(
                  height: MyAppSize.height! * 0.45,
                ),
                MyButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              SellerSignupCreatePasswordPage()));
                    },
                    title: "Next",
                    color: MyColors.LIGHT_GREEN,
                    textColor: Colors.white,
                    splashColor: MyColors.YELLOW,
                    height: 45,fontSize: 13,borderRadius: 30),
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/provider/verification_code_provider.dart';
import 'package:pet_paradise/seller_module/pages/authentication/seller_signup_create_password_page.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/size_config.dart';
import 'package:provider/provider.dart';

class SellerSignupCodeVerificationPage extends StatefulWidget {
  late final String _verificationId;
  late final int? _resendToken;

  SellerSignupCodeVerificationPage(
      {Key? key, required String verificationId, int? resendToken})
      : super(key: key) {
    this._verificationId = verificationId;
    this._resendToken = resendToken;
  }

  @override
  State<SellerSignupCodeVerificationPage> createState() =>
      _SellerSignupCodeVerificationPageState();
}

class _SellerSignupCodeVerificationPageState
    extends State<SellerSignupCodeVerificationPage> {
   TextEditingController _digitOneController = TextEditingController();
   TextEditingController _digitTwoController = TextEditingController();
   TextEditingController _digitThreeController = TextEditingController();
   TextEditingController _digitFourController = TextEditingController();
   TextEditingController _digitFiveController = TextEditingController();
   TextEditingController _digitSixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile: mobile(context: context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///Mobile UI
  Widget mobile({required BuildContext context}) {
    return ChangeNotifierProvider<VerificationCodeProvider>(
        create: (context) => VerificationCodeProvider(),
        child: Stack(
          children: [
            backgroundWidget(),
            leftAndRightPadding(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MyAppSize.height! * 0.15,
                    ),
                    Text(
                      "Enter The  Code",
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'Itim-Regular'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please enter the 6-digit code sent to;\n${widget._verificationId}",
                      style:
                          TextStyle(fontSize: 15, fontFamily: 'Itim-Regular'),
                    ),
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
                      height: MyAppSize.height! * 0.40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Didn't received code ?",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Itim-Regular',
                              fontWeight: FontWeight.w500),
                        ),
                        Consumer<VerificationCodeProvider>(
                          builder: (context, data, child) {
                            data.counter();
                            return clickAbleText(
                                text: data.msg,
                                onTap: () {
                                  data.remainingTime = 60;
                                },
                                textColor: data.resendCodeEnable == true
                                    ? MyColors.RED
                                    : MyColors.LIGHT_PINK,
                                textSize: 13,
                                fontFamily: 'Itim-Regular',
                                enable: data.resendCodeEnable);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    MyButton(
                        onPressed: () {
                          if (_digitOneController.text.isEmpty ||
                              _digitTwoController.text.isEmpty ||
                              _digitThreeController.text.isEmpty ||
                              _digitFourController.text.isEmpty ||
                              _digitFiveController.text.isEmpty ||
                              _digitSixController.text.isEmpty) {
                            print("${_digitOneController.text}${_digitTwoController.text}${_digitThreeController.text}${_digitFourController.text}${_digitFiveController.text}${_digitSixController.text}");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please enter Code"),
                                backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
                              ),
                            );
                          } else {
                            String smsCode =
                                "${_digitOneController.text}${_digitTwoController.text}${_digitThreeController.text}${_digitFourController.text}${_digitFiveController.text}${_digitSixController.text}";
                            PhoneAuthCredential credentials =
                                PhoneAuthProvider.credential(
                                    verificationId: widget._verificationId,
                                    smsCode: smsCode);
                            print("ProviderId : ${credentials.providerId}");
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SellerSignupCreatePasswordPage()));
                          }
                        },
                        title: "Next",
                        color: MyColors.MATERIAL_LIGHT_GREEN,
                        textColor: Colors.white,
                        splashColor: MyColors.YELLOW,
                        height: 45,
                        fontSize: 13,
                        borderRadius: 30,
                        fontFamily: 'Itim-Regular'),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/custom_widgets/dailogs.dart';
import 'package:pet_paradise/seller_module/pages/authentication/seller_signup_code_verification_page.dart';
import 'package:pet_paradise/seller_module/pages/authentication/seller_signup_create_password_page.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/size_config.dart';

class SellerSignUpMobileNumberPage extends StatefulWidget {
  const SellerSignUpMobileNumberPage({Key? key}) : super(key: key);

  @override
  State<SellerSignUpMobileNumberPage> createState() =>
      _SellerSignUpMobileNumberPageState();
}

class _SellerSignUpMobileNumberPageState
    extends State<SellerSignUpMobileNumberPage> {
  var _mobileNumberController = TextEditingController();

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
    return Stack(
      children: [
        backgroundWidget(),
        Padding(
          padding: EdgeInsets.only(
              left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MyAppSize.height! * 0.2,
                ),
                Center(
                    child: Text(
                  "What's Your Mobile Number?",
                  style: TextStyle(fontFamily: 'Itim-Regular', fontSize: 20),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "A Mobile Number is required for Signup",
                  style: TextStyle(fontFamily: 'Itim-Regular', fontSize: 15),
                )),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 55,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _mobileNumberController,
                      decoration: textFieldDecorationWithOutIcon(
                        hint: "Enter Mobile Number",
                        borderRadius: 30,


                      ),
                    )),
                SizedBox(
                  height: MyAppSize.height! * 0.4,
                ),
                MyButton(
                    onPressed: () async {
                      CustomProgressIndicatorDialog(context: context);
                      if (_mobileNumberController.text.isNotEmpty) {
                        await FirebaseAuth.instanceFor(app: Firebase.app()).verifyPhoneNumber(
                          phoneNumber: _mobileNumberController.text.toString(),
                          verificationCompleted:
                              (PhoneAuthCredential credential) {
                            Navigator.pop(context);
                              },
                          verificationFailed: (FirebaseAuthException e) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "${e.code}",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
                            ));
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Code Sent To Your Mobile Number...")));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SellerSignupCodeVerificationPage(verificationId: verificationId, resendToken: resendToken,)));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Please Enter Mobile Number",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: MyColors.MATERIAL_LIGHT_GREEN,
                        ));
                      }
                    },
                    title: "Next",
                    fontFamily: 'Itim-Regular',
                    color: MyColors.MATERIAL_LIGHT_GREEN,
                    textColor: Colors.white,
                    borderRadius: 30,
                    height: 48,
                    splashColor: MyColors.YELLOW,
                    fontSize: 13),
              ],
            ),
          ),
        )
      ],
    );
  }
}

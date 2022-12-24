import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller/pages/seller_signup_code_verification_page.dart';
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
                Center(child: Text("What's Your Mobile Number?" , style: TextStyle(fontFamily: 'Itim-Regular' , fontSize: 20),)),
                SizedBox(
                  height: 10,
                ),
                Center(child: Text("A Mobile Number is required for Signup", style: TextStyle(fontFamily: 'Itim-Regular' , fontSize: 15),)),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 55,
                    child: TextField(
                      decoration: textFieldDecorationWithOutIcon(
                        hint: "Enter Mobile Number",
                        borderRadius: 30,
                      ),
                    )),
                SizedBox(
                  height: MyAppSize.height! * 0.4,
                ),
                MyButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SellerSignupCodeVerificationPage(verificationCode: "123456",)));
                    },
                    title: "Next",
                    fontFamily: 'Itim-Regular',
                    color: MyColors.LIGHT_GREEN,
                    textColor: Colors.white,
                    borderRadius: 30,
                    height: 48,
                    splashColor: MyColors.YELLOW,fontSize: 13),

              ],
            ),
          ),
        )
      ],
    );
  }

  ///Tablet UI
  Widget tablet({required BuildContext context}) {
    return Center(child: Text("Tablet UI under Designing "));
  }

  ///web UI
  Widget web({required BuildContext context}) {
    return Center(child: Text("Tablet UI under Designing "));
  }
}

import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller_module/pages/seller_home_page.dart';
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
        SingleChildScrollView(
          child: leftAndRightPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MyAppSize.height! * 0.15,
                ),
                Text("Create an account",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                SizedBox(height: 10,),
                Text("Set up a password", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
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
                Text("Referral Code", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
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
                Text("I agree to Pet Paradise’s ${clickAbleText(text: "Terms of Usage ", onTap: (){})} and for my personal data to be processed according to Pet Paradise Privacy Policy "),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SellerHomePage()));
                  },
                    fontFamily: 'Itim-Regular',
                  title: "Agree & Create Account",
                  color: MyColors.MATERIAL_LIGHT_GREEN,
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

}

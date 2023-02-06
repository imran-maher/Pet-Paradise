import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller_module/pages/seller_home_page.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/size_config.dart';

class SellerLoginPage extends StatefulWidget {
  const SellerLoginPage({Key? key}) : super(key: key);

  @override
  State<SellerLoginPage> createState() => _SellerLoginPageState();
}

class _SellerLoginPageState extends State<SellerLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile: mobile(context),
        web: webUI(),
        tablet: tabletUI(),
      ),
    );
  }

  ///Mobile UI
  Widget mobile(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(),
        SingleChildScrollView(
          child: leftAndRightPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///Top Text
                SizedBox(
                  height: MyAppSize.height! * 0.2,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(fontFamily: 'Itim-Regular', fontSize: 20),
                ),
                SizedBox(
                  height: MyAppSize.height! * 0.01,
                ),
                Text(
                  "Login with your Password",
                  style: TextStyle(fontFamily: 'Itim-Regular', fontSize: 15),
                ),
                SizedBox(height: MyAppSize.height! * 0.05),

                ///Edit Text Fields
                // Email / Mobile Number Text Field
                Container(
                  height: 55,
                  child: TextField(
                    decoration: textFieldDecorationWithOutIcon(
                      hint: "Email/Mobile ",
                      borderRadius: 30,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),

                SizedBox(height: MyAppSize.height! * 0.02),
                //Password Text Field
                Container(
                  height: 55,
                  child: TextField(
                    decoration: textFieldDecorationWithOutIcon(
                        hint: "Password", borderRadius: 30),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: MyAppSize.height! * 0.35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: clickAbleText(
                    text: "Forgot Password?",
                    fontFamily: 'Itim-Regular',
                    onTap: () {},
                    textColor: MyColors.RED,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MyAppSize.height! * 0.02,
                ),
                MyButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerHomePage()));
                    },
                    title: "Login",
                    color: MyColors.MATERIAL_LIGHT_GREEN,
                    textColor: Colors.white,
                    borderRadius: 35,
                    height: 45,
                    fontSize: 14,
                    splashColor: MyColors.YELLOW,fontFamily: 'Itim-Regular'),
              ],
            ),
          ),
        )
      ],
    );
  }

}

import 'package:flutter/material.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller_module/pages/authentication/seller_signup_mobile_number_page.dart';


import '../../utils/responsive_controller.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';
import 'authentication/seller_login_page.dart';

class SellerStartUpPage extends StatelessWidget {
  const SellerStartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: transparentAppBar(context: context),
        body: Responsive(
          mobile: mobile(context),
          tablet: tabletUI(),
          web: webUI(),
        ));
  }

  ///Mobile
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
                  padding: const EdgeInsets.only(top: 130.0),
                  child: Container(
                    height: 180,
                    width: 180,
                    child: Image(
                      image: AssetImage(
                        "assets/images/logo_with_text.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                //Register with mobile number button
                MyButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SellerSignUpMobileNumberPage()));
                    },
                    title: "Register with mobile number",
                    color: MyColors.GREEN,
                    textColor: Colors.white,
                    fontSize: 13,
                    splashColor: MyColors.MATERIAL_LIGHT_GREEN,
                    fontFamily: 'Itim-Regular'),

                SizedBox(height: 22),

                //Login with Password
                MyButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SellerLoginPage()));
                    },
                    title: "Login with password",
                    color: MyColors.MATERIAL_LIGHT_GREEN,
                    textColor: Colors.white,
                    fontSize: 13,
                    splashColor: MyColors.GREEN,fontFamily: 'Itim-Regular'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

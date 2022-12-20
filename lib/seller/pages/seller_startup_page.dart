import 'package:flutter/material.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller/pages/seller_login_page.dart';

import '../../controllers/responsive_controller.dart';
import '../../utils/colors.dart';
import '../../utils/size_config.dart';

class SellerStartUpPage extends StatelessWidget {
  const SellerStartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back,
            color: MyColors.LIGHT_GREEN,
          ),
        ),
        body: Responsive(
          mobile: mobile(context),
          tablet: tablet(context),
          web: web(context),
        ));
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
                    onPressed: () {},
                    title: "Register with mobile number",
                    color: MyColors.GREEN,
                    textColor: Colors.white,
                    fontSize: 13,splashColor: MyColors.LIGHT_GREEN),

                SizedBox(height: 22),

                //Login with Password
                MyButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SellerLoginPage()));
                    },
                    title: "Login with password",
                    color: MyColors.LIGHT_GREEN,
                    textColor: Colors.white,
                    fontSize: 13, splashColor: MyColors.GREEN),
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

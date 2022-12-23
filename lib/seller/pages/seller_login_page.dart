import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
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
        web: web(context),
        tablet: tablet(context),
      ),
    );
  }

  ///Mobile UI
  Widget mobile(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: MyAppSize.width! * 0.07, left: MyAppSize.width! * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///Top Text
                SizedBox(
                  height: MyAppSize.height! * 0.2,
                ),
                Text("Welcome Back"),
                SizedBox(
                  height: MyAppSize.height! * 0.01,
                ),
                Text("Login with your Password"),
                SizedBox(height: MyAppSize.height! * 0.05),

                ///Edit Text Fields
                // Email / Mobile Number Text Field
                Container(
                  height: 48,
                  child: TextField(
                    decoration: textFieldDecorationWithIcon(
                        hint: "Email/Mobile ", borderRadius: 40),
                    keyboardType: TextInputType.text,
                  ),
                ),

                SizedBox(height: MyAppSize.height! * 0.02),
                //Password Text Field
                Container(
                  height: 48,
                  child: TextField(
                    decoration:
                        textFieldDecorationWithIcon(hint: "Password", borderRadius: 40),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: MyAppSize.height! * 0.35,),
                Padding(padding: EdgeInsets.only(left: 35),child: GestureDetector(child: Text("Forgot Password?",style: TextStyle(color: MyColors.RED),))),
                SizedBox(height: MyAppSize.height! * 0.02,),
                MyButton(onPressed: (){}, title: "Login", color: MyColors.LIGHT_GREEN, textColor: Colors.white , borderRadius: 35,height: 45,fontSize: 13,splashColor: MyColors.YELLOW),

              ],
            ),
          ),
        )
      ],
    );
  }

  //Tablet UI
  Widget tablet(BuildContext context) {
    return Center(
      child: Text("Tablet UI in Designing Process"),
    );
  }

  //web UI
  Widget web(BuildContext context) {
    return Center(
      child: Text("Web UI in Designing Process"),
    );
  }
}

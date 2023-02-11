import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import 'package:pet_paradise/service_provider_module/pages/service_selection_page.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import '../custom_widgets/custom_widgets.dart';
import '../seller_module/pages/seller_startup_page.dart';
import '../utils/colors.dart';
import '../utils/size_config.dart';
import '../authentication_module/pages/login_page.dart';

String dropDownValue = "English";
double buttonSpace = 20;

class ChoicePage extends StatefulWidget {

   ChoicePage({Key? key}) : super(key: key){

  }

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    MyAppSize.config(MediaQuery.of(context));
    return Scaffold(
      body: Responsive(
        mobile: mobile(context),
        web: webUI(),
        tablet: tabletUI(),
      ),
    );
  }

  /// Mobile UI
  Widget mobile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MyAppSize.width! * 0.05, right: MyAppSize.width! * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),

          Image(
            image: AssetImage("assets/images/logo.png"),
            height: 135,
            width: 163,
          ),
          SizedBox(
            height: buttonSpace,
          ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Card(
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: MyColors.YELLOW),
                child: Text("General User"),
              ),
          ),
            ),
          GestureDetector(
            child: Card(
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: MyColors.MATERIAL_LIGHT_GREEN),
                child: Text("Seller"),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

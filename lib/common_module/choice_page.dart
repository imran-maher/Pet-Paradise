import 'package:flutter/material.dart';
import 'package:pet_paradise/seller_module/pages/seller_startup_page.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';
import '../utils/colors.dart';
import '../utils/size_config.dart';
import '../authentication_module/pages/login_page.dart';

String dropDownValue = "English";
double buttonSpace = 20;

class ChoicePage extends StatefulWidget {
  ChoicePage({Key? key}) : super(key: key) {}

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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Card(
              shadowColor: Colors.yellowAccent,
              elevation: 5,
              child: Container(
                  height: 150,
                  decoration:
                      BoxDecoration(color: MyColors.MATERIAL_LIGHT_GREEN),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "General App User",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Itim-Regular',
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "If You are Pet Owner or any Service Provider (Veterinarian , Breeder , Trainer)\nPlease Click Here",textAlign: TextAlign.center,style: TextStyle(color: MyColors.YELLOW),),
                      ),
                    ],
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SellerStartUpPage()));
            },
            child: Card(
              elevation: 5,
              child: Container(
                  height: 150,
                  decoration:
                  BoxDecoration(color: MyColors.MATERIAL_LIGHT_GREEN),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Seller",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Itim-Regular',
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "If You Want to Sell Your Products related to pets.\nPlease Click Here",textAlign: TextAlign.center,style: TextStyle(color: MyColors.YELLOW),),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

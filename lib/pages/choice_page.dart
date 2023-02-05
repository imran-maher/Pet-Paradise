import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/pages/service_selection_page.dart';
import 'package:pet_paradise/module/app_user.dart';
import 'package:pet_paradise/seller/pages/seller_startup_page.dart';
import '../custom_widgets/custom_widgets.dart';
import '../utils/colors.dart';
import '../utils/size_config.dart';
import 'login_page.dart';

String dropDownValue = "English";
double buttonSpace = 20;

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

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
        web: web(context),
        tablet: tablet(context),
      ),
    );
  }
}

//TODO : Go To Login Screen
goToLoginScreen(BuildContext context,String userType) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => LoginScreen(userType: userType,),
    ),
  );
}

//TODO : Mobile UI
Widget mobile(BuildContext context) {
  // return Container(
  //   decoration: BoxDecoration(
  //     image: DecorationImage(
  //       fit: BoxFit.cover,
  //       image: AssetImage("assets/images/backgrounds/bg1.jpg"),
  //     ),
  //   ),
  //   child:
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
          //TODO : Top Logo
          Image(
            image: AssetImage("assets/images/logo.png"),
            height: 135,
            width: 163,
          ),
          SizedBox(
            height: buttonSpace,
          ),
          //TODO : Pet Owner
          MyButton(
            onPressed: (){
              Navigator.of(context) .push(MaterialPageRoute( builder: (context) => LoginScreen(userType: AppUser.PET_OWNER)));
            },
            title: "Pet Owner",
            color: MyColors.MATERIAL_LIGHT_GREEN,
            textColor: Colors.white,
          ),
          SizedBox(
            height: buttonSpace,
          ),
          //TODO : Seller
          MyButton(
            onPressed: (){
          Navigator.of(context) .push(MaterialPageRoute( builder: (context) => SellerStartUpPage()));
          },
            title: "Seller",
            color: MyColors.MATERIAL_LIGHT_GREEN,
            textColor: Colors.white,
          ),
          SizedBox(
            height: buttonSpace,
          ),
          //TODO: Services
          MyButton(
            onPressed:  (){
              Navigator.of(context) .push(MaterialPageRoute( builder: (context) => ServiceSelectionPage()));
            },
            title: "Services",
            color: MyColors.MATERIAL_LIGHT_GREEN,
            textColor: Colors.white,
          ),

          SizedBox(
            height: 70,
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Text(
                "Term and Conditions",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),

  );
}

//TODO : Tablet UI
Widget tablet(BuildContext context) {
  return Center(child: Text("In Designing Process"));
}

//TODO : Web UI
Widget web(BuildContext context) {
  return Center(child: Text("In Designing Process"));
}

import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/module/get_started_page_data.dart';

import '../custom_widgets/custom_widgets.dart';
import '../utils/colors.dart';
import '../utils/size_config.dart';
import 'login_page.dart';

String dropDownValue = "English";
double buttonSpace = 20;

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({Key? key}) : super(key: key);
  //Get Started with Blog Page Data
  static final GetStartedPageData getStartedWithBlogs = GetStartedPageData(
      pageTitle: "Blogs & Articles",
      subTitle: "Publish Your Own  Passion In Your Own Way ",
      imgUrl:
          "https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80");
  //Get Started with Adopt a pet Page Data
  static final GetStartedPageData getStartedWithAdoptAPet = GetStartedPageData(
      pageTitle: "MAKE  A NEW FRIEND",
      subTitle:
          "Instant access to thousands of veterans.You may simply get in touch with them and schedule appointments at times that work for you.",
      imgUrl:
          "https://images.unsplash.com/photo-1450778869180-41d0601e046e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=986&q=80");
  //Get Started with Breeder Page Data
  static final GetStartedPageData getStartedWithBreeder = GetStartedPageData(
      pageTitle: "FIND THE BEST BREEDER FOR YOUR PET",
      subTitle:"Instant access to thousands of Breeders. You may simply get in touch with them and schedule appointments at times that work for you.",
      imgUrl:"https://images.unsplash.com/photo-1602612142771-04b0adfca46d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  //Get Started with Trainer Page Data
  static final GetStartedPageData getStartedWithTrainer = GetStartedPageData(
      pageTitle: "FIND THE BEST TRAINER FOR YOUR PET",
      subTitle: "Instant access to thousands of trainers.You may simply get in touch with them and schedule appointments at times that work for you.",
  imgUrl: "https://images.unsplash.com/photo-1484190929067-65e7edd5a22f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  //Get Started with Vet Page Data
  static final GetStartedPageData getStartedWithVet = GetStartedPageData(
      pageTitle: "FIND THE BEST VETERINARIAN FOR YOUR PET",
      subTitle: "Instant access to thousands of veterans.You may simply get in touch with them and schedule appointments at times that work for you.",
      imgUrl: "https://images.unsplash.com/photo-1628009368231-7bb7cfcb0def?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
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
goToLoginScreen(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => LoginScreen(),
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
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          title: "Pet Owner",
          color: MyColors.LIGHT_GREEN40,
          textColor: MyColors.DARK_GREEN,
        ),
        SizedBox(
          height: buttonSpace,
        ),
        //TODO : Seller
        MyButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          title: "Seller",
          color: MyColors.LIGHT_GREEN40,
          textColor: MyColors.DARK_GREEN,
        ),
        SizedBox(
          height: buttonSpace,
        ),
        //TODO: Services
        MyButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          title: "Services",
          color: MyColors.LIGHT_GREEN40,
          textColor: MyColors.DARK_GREEN,
        ),
        SizedBox(
          height: buttonSpace,
        ),
        //TODO: Guest
        MyButton(
          onPressed: () {},
          title: "Guest",
          color: MyColors.LIGHT_GREEN40,
          textColor: MyColors.DARK_GREEN,
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

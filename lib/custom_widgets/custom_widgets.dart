//TODO: My Custom Button For Dashboards

//TODO : My Custom Button Widget

import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/responsive_controller.dart';


import 'package:pet_paradise/utils/size_config.dart';

import '../seller_module/pages/seller_bottom_nav.dart';
import '../utils/colors.dart';

Widget MyButton(
    {required void onPressed()?,
    required String title,
    required Color color,
    required Color textColor,
    double? fontSize,
    Color? splashColor,
    double? height,
    double? borderRadius,
    double? width,
    String? fontFamily}) {
  return Container(
    height: height == null ? 48 : height,
    width: width == null ? null : width,
    child: MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius == null ? 10 : borderRadius)),
      color: color,
      splashColor: splashColor == null ? MyColors.PARRIT_GREEN : splashColor,
      child: Text(
        title,
        style: TextStyle(
            color: textColor,
            fontFamily: fontFamily == null ? null : fontFamily,
            fontSize: fontSize == null ? 18 : fontSize,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}

/// InputDecoration for Login and Sign up TextFields
InputDecoration textFieldDecorationWithIcon(
    {required String hint, IconData? icon, double? borderRadius}) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Icon(icon),
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(borderRadius == null ? 5 : borderRadius),
    ),
  );
}

/// InputDecoration for Login and Sign up TextFields
InputDecoration textFieldDecorationWithOutIcon(
    {required String hint, double? borderRadius}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      fontSize: 13,
    ),
    counter: Offstage(),
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(borderRadius == null ? 5 : borderRadius),
    ),
  );
}

///Login and SignUp Button
Widget loginAndSignUpButton(
    {required Function onPressed, required String title}) {
  return MaterialButton(
    onPressed: onPressed(),
    textColor: Colors.black,
    minWidth: 139,
    height: 39,
    child: Text(title),
    color: MyColors.MATERIAL_LIGHT_GREEN,
  );
}

/// Main Dashboard Card

Widget dashboardCard(
    {required Function onTap,
    required String logoImgPath,
    required String title}) {
  return GestureDetector(
    onTap: onTap(),
    child: Container(
      height: 250,
      width: MyAppSize.width! * 44,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: AssetImage(logoImgPath)),
            Text(title),
          ],
        ),
      ),
    ),
  );
}

///Background Widget
Widget backgroundWidget() {
  return Container(
    width: MyAppSize.width,
    child: Image(
      image: AssetImage("assets/images/rectDesign.png"),
      alignment: Alignment.topRight,
    ),
  );
}

/// MyAppBar with TransparentBackground
AppBar transparentAppBar({required BuildContext context, String? centerTitle}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: centerTitle == null ? false : true,
    title: Text(centerTitle ?? ''),
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back,
        color: MyColors.MATERIAL_LIGHT_GREEN,
      ),
    ),
  );
}

/// Right and Left Padding for All Pages
Padding leftAndRightPadding({required Widget child}) {
  return Padding(
    padding: EdgeInsets.only(
        right: MyAppSize.width! * 0.05, left: MyAppSize.width! * 0.05),
    child: child,
  );
}

///Code Verification TextField
Widget codeVerificationTextField(
    {required BuildContext context,
    required TextEditingController controller,
    double? width,
    required int digitNumber}) {
  return Container(
      width: width == null ? MyAppSize.width! * 0.14 : width,
      height: 55,
      child: TextField(
          decoration: textFieldDecorationWithOutIcon(
            hint: "-",
            borderRadius: 10,
          ),
          textAlign: TextAlign.center,
          maxLength: 1,
          showCursor: false,
          autofocus: true,
          keyboardType: TextInputType.number,
          onChanged: (str) {
            if (digitNumber > 1 && digitNumber < 6) {
              if (str.length == 1) {
                FocusScope.of(context).nextFocus();
              } else if (str.length == 0) {
                FocusScope.of(context).previousFocus();
              }
            } else if (digitNumber == 1) {
              if (str.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            } else {
              if (str.length == 0) {
                FocusScope.of(context).previousFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            }
          }));
}

///Clickable Text
Widget clickAbleText(
    {required String text,
    required void onTap(),
    bool? enable,
    bool? underLine,
    double? textSize,
    Color? textColor,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    String? fontFamily}) {
  return GestureDetector(
    onTap: enable == true ? onTap : null,
    child: Text(
      text,
      style: TextStyle(
        color: textColor == null ? Colors.black : textColor,
        decoration:
            underLine == null ? TextDecoration.none : TextDecoration.underline,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
        fontSize: textSize == null ? 13 : textSize,
        fontFamily: fontFamily == null ? null : fontFamily,
      ),
      textAlign: textAlign == null ? TextAlign.start : textAlign,
    ),
  );
}

///Seller Center Profile Card

Widget sellerCenterCard({required BuildContext buildContext}) {
  return Container(
    width: MyAppSize.width,
    height: 325.0,
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Please Complete Profile "),
          ListView.builder(itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text("${index + 1}"),
              title: Text("Button"),
              trailing: Icon(Icons.abc),
            );
          }),
        ],
      ),
    ),
  );
}

///Important Text
Widget importantText(
    {required String text, double? fontSize, Color? textColor}) {
  return Row(
    children: [
      Text(
        "*",
        style: TextStyle(color: Colors.red),
      ),
      Text(
        text,
        style: TextStyle(
            color: textColor == null ? Colors.grey : textColor,
            fontSize: fontSize == null ? 13 : fontSize,
            fontFamily: 'Itim-Regular'),
      )
    ],
  );
}

///ReadOnly Text Field
Widget myCustomTextFiled(
    {required BuildContext context,
    required TextEditingController controller,
    required String hint,
    bool important = false}) {
  return Container(
      height: 30,
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          label: important ? importantText(text: hint) : Text(hint),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
      ));
}

///Custom Body
Widget customBodyWithCenterTextAppBar(
    {required BuildContext context,
    required String appBarTitle,
    required Responsive responsiveScreens,
    SellerBottomNavBar? bottomNavigationBar}) {
  return Scaffold(
    bottomNavigationBar: bottomNavigationBar,
    backgroundColor: MyColors.WHITE_WITH_GREEN_SHADE,
    appBar: transparentAppBar(context: context, centerTitle: appBarTitle),
    body: responsiveScreens,
  );
}

///Seller Profile Container
Widget sellerProfileContainer(
    {required String tittle,
    required Function onTap,
    bool? topBorder,
    bool? bootomBorder}) {
  return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          Container(
            height: topBorder == null ? 0 : 1,
            color: MyColors.GREEN_LIGHT_SHADE,
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    tittle,
                    style: TextStyle(fontSize: 15, fontFamily: 'Itim-Regular'),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: MyColors.GREEN,
                )
              ],
            ),
          ),
          Container(
            height: bootomBorder == null ? 0 : 1,
            color: MyColors.GREEN_LIGHT_SHADE,
          ),
        ],
      ));
}

/// Seller Tools Button
Widget sellerToolButton(
    {required  onTape(),
    required String title,
    required String imgPath}) {
  return GestureDetector(
    onTap: onTape,
    child: Container(
      height: 100,
      width: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imgPath)),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(fontFamily: 'itim-Regular', fontSize: 14),
          )
        ],
      ),
    ),
  );
}

///Seller Notification custom Container
Widget customContainerForSellerNotification(
    {required String imgName, required String title}) {
  return Container(
    height: 80,
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: Image(
            image: AssetImage("assets/images/$imgName"),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15, fontFamily: 'Itim-Regular'),
        )
      ],
    ),
  );
}

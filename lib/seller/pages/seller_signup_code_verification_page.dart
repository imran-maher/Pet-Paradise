import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/size_config.dart';

class SellerSignupCodeVerificationPage extends StatefulWidget {
  final String verificationCode;

  SellerSignupCodeVerificationPage({Key? key, required this.verificationCode})
      : super(key: key);

  @override
  State<SellerSignupCodeVerificationPage> createState() =>
      _SellerSignupCodeVerificationPageState();
}

class _SellerSignupCodeVerificationPageState
    extends State<SellerSignupCodeVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
      body: Responsive(
        mobile:
            mobile(context: context, verificationCode: widget.verificationCode),
        tablet: tablet(context: context),
        web: web(context: context),
      ),
    );
  }

  ///Mobile UI
  Widget mobile(
      {required BuildContext context, required String verificationCode}) {
    return Stack(
      children: [
        backgroundWidget(),
        leftAndRightPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MyAppSize.height! * 0.2,
                ),
                Text("Enter The  Code"),
                Text(
                    "Please Enter Verification Code Which Sent to \n$verificationCode"),

                ///Verification Code UI
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///Digit One
                    Container(
                        width: MyAppSize.width! * 0.13,
                        child: TextField(
                          decoration: textFieldDecorationWithOutIcon(
                            hint: "",
                            borderRadius: 10,
                          ),
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          showCursor: false,
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          onChanged: (str){
                            if(str.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        )),
                    Container(
                        width: MyAppSize.width! * 0.13,
                        child: TextField(
                          decoration: textFieldDecorationWithIcon(hint: ""),
                        )),
                    Container(
                        width: MyAppSize.width! * 0.13,
                        child: TextField(
                          decoration: textFieldDecorationWithIcon(hint: ""),
                        )),
                    Container(
                        width: MyAppSize.width! * 0.13,
                        child: TextField(
                          decoration: textFieldDecorationWithIcon(hint: ""),
                        )),
                    Container(
                        width: MyAppSize.width! * 0.13,
                        child: TextField(
                          decoration: textFieldDecorationWithIcon(hint: ""),
                        )),
                    Container(
                        width: MyAppSize.width! * 0.13,
                        child: TextField(
                          decoration: textFieldDecorationWithIcon(hint: ""),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  ///Tablet UI
  Widget tablet({required BuildContext context}) {
    return Center(
      child: Text("Tablet UI In Design Process"),
    );
  }

  ///Web UI
  Widget web({required BuildContext context}) {
    return Center(
      child: Text("Web UI In Design Process"),
    );
  }
}

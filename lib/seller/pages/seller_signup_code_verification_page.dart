import 'package:flutter/material.dart';
import 'package:pet_paradise/controllers/responsive_controller.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/seller/pages/seller_signup_create_password_page.dart';
import 'package:pet_paradise/seller/provider/verification_code_provider.dart';
import 'package:pet_paradise/utils/size_config.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';

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
  final TextEditingController _digitOneController = TextEditingController();
  final TextEditingController _digitTwoController = TextEditingController();
  final TextEditingController _digitThreeController = TextEditingController();
  final TextEditingController _digitFourController = TextEditingController();
  final TextEditingController _digitFiveController = TextEditingController();
  final TextEditingController _digitSixController = TextEditingController();

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
    return ChangeNotifierProvider<VerificationCodeProvider>(
        create: (context) => VerificationCodeProvider(),
        child: Stack(
          children: [
            backgroundWidget(),
            leftAndRightPadding(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MyAppSize.height! * 0.15,
                    ),
                    Text(
                      "Enter The  Code",
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'Itim-Regular'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please enter the 6-digit code sent to;\n$verificationCode",
                      style:
                          TextStyle(fontSize: 15, fontFamily: 'Itim-Regular'),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ///Verification Code UI
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///Digit One
                        codeVerificationTextField(
                            context: context,
                            controller: _digitOneController,
                            digitNumber: 1),

                        ///Digit Two
                        codeVerificationTextField(
                            context: context,
                            controller: _digitTwoController,
                            digitNumber: 2),

                        ///Digit Three
                        codeVerificationTextField(
                            context: context,
                            controller: _digitThreeController,
                            digitNumber: 3),

                        ///Digit Four
                        codeVerificationTextField(
                            context: context,
                            controller: _digitFourController,
                            digitNumber: 4),

                        ///Digit Five
                        codeVerificationTextField(
                            context: context,
                            controller: _digitFiveController,
                            digitNumber: 5),

                        ///Digit Six
                        codeVerificationTextField(
                            context: context,
                            controller: _digitSixController,
                            digitNumber: 6),
                      ],
                    ),
                    SizedBox(
                      height: MyAppSize.height! * 0.40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Didn't received code ?",style: TextStyle(fontSize: 13,fontFamily: 'Itim-Regular',fontWeight: FontWeight.w500),),
                        Consumer<VerificationCodeProvider>(
                          builder: (context, data, child) {
                            data.counter();
                            return clickAbleText(text: data.msg, onTap: (){data.remainingTime = 60;},textColor: data.resendCodeEnable == true ? MyColors.RED : MyColors.LIGHT_PINK,textSize: 13,fontFamily: 'Itim-Regular',enable: data.resendCodeEnable);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    MyButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SellerSignupCreatePasswordPage()));
                        },
                        title: "Next",
                        color: MyColors.MATERIAL_LIGHT_GREEN,
                        textColor: Colors.white,
                        splashColor: MyColors.YELLOW,
                        height: 45,
                        fontSize: 13,
                        borderRadius: 30,
                        fontFamily: 'Itim-Regular'),
                  ],
                ),
              ),
            )
          ],
        ));
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/custom_widgets/dailogs.dart';
import 'package:pet_paradise/authentication_module/pages/login_page.dart';
import 'package:pet_paradise/pet_owner_module/pages/main_dashboard_page.dart';
import 'package:pet_paradise/utils/colors.dart';
import '../authentication_module/module/app_user.dart';

import 'firebase_helper.dart';

///Firebase Signup with Email and Password
Future<String> signUp(
    {required BuildContext context,
    required String email,required String name , required String userType,
    required String password}) async {
  CustomProgressIndicatorDialog(context: context);
  String response = "";
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      user.sendEmailVerification().whenComplete(() {
        AppUser appUser = AppUser(userType: userType, uid: user.uid, userName: name, userEmail: email);
        if (userType == AppUser.PET_OWNER) {
          FirebaseHelper.PET_OWNER_DATABASE_REF
              .child(user.uid)
              .set(appUser.toMap());
        } else if (appUser.userType == AppUser.SERVICE_PROVIDER) {
          FirebaseHelper.SERVICE_PROVIDERS_DATABASE_REF
              .child(user.uid)
              .set(appUser.toMap());
        } else if (appUser.userType == AppUser.SELLER) {
          FirebaseHelper.SELLER_DATABASE_REF
              .child(user.uid)
              .set(appUser.toMap());
        }
        response = "Register Successfully. Check Your Email To Verify...";
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen(userType: appUser.userType)));
      });
    } else {
      Navigator.of(context).pop();
    }
  } on FirebaseAuthException catch (e) {
    response = e.code;
    Navigator.of(context).pop();
  } catch (e) {
    Navigator.of(context).pop();
  }

  return response;
}

///Firebase Login with Email and Password
Future<String> login(
    {required context,
    required String email, required String userType,
    required String password}) async {
  String response = "";

  try {
    CustomProgressIndicatorDialog(context: context);
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email, password: password);
    User? user = userCredential.user;
    if (user != null && user.emailVerified) {
      FirebaseHelper.PET_OWNER_DATABASE_REF.onValue.listen((event) {
        var appUserDataFromFirebase =
            AppUser.fromJason(event.snapshot.child(user.uid).value);
        print(appUserDataFromFirebase);
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainDashboardPage(
                  appUser: appUserDataFromFirebase,
                )));
        showSnackBarMsg(context, "Login Successfully");
      });
    } else if (user != null && user.emailVerified == false) {
      Navigator.pop(context);
      showDialog(
          barrierDismissible: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.white,
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 40,
                      color: MyColors.MATERIAL_LIGHT_GREEN,
                      child: Center(
                        child: Text(
                          "Email verification",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Center(
                      child: leftAndRightPadding(
                        child: Text(
                          "Dear user,Your Email is not verified please check your Email and verify it.\n If you don't receive Email or Email link is expired, click on re-send link button to get new verification link",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: MyButton(
                                borderRadius: 0,
                                height: 40,
                                fontSize: 12,
                                onPressed: () {
                                  user.sendEmailVerification().whenComplete(() {
                                    Navigator.pop(context);
                                    showSnackBarMsg(context,
                                        "Email verification link send successfully.");
                                  });
                                },
                                title: "Re-Send Link",
                                fontFamily: 'Itim-Regular',
                                color: MyColors.MATERIAL_LIGHT_GREEN,
                                textColor: Colors.white),
                          ),
                          Expanded(
                            child: MyButton(
                                borderRadius: 0,
                                height: 40,
                                fontSize: 12,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                title: "Cancel",
                                fontFamily: 'Itim-Regular',
                                color: MyColors.MATERIAL_LIGHT_GREEN,
                                textColor: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    showSnackBarMsg(context, e.code, error: true);
  } catch (e) {
    Navigator.pop(context);
    showSnackBarMsg(context, e.toString(), error: true);
  }

  return response;
}

/// Reset Password
String senResetPasswordLink(
    {required String email, required BuildContext context}) {
  CustomProgressIndicatorDialog(context: context);
  try {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).whenComplete(() {
      Navigator.pop(context);
      showSnackBarMsg(context, "Password resend link send");
    });
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    showSnackBarMsg(context, e.code, error: true);
  } catch (e) {
    Navigator.pop(context);
    showSnackBarMsg(context, e.toString(), error: true);
  }

  return "";
}

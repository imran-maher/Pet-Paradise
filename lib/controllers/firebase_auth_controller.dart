import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_paradise/controllers/firebase_helper.dart';
import 'package:pet_paradise/custom_widgets/dailogs.dart';
import 'package:pet_paradise/pages/login_page.dart';
import 'package:pet_paradise/pages/main_dashboard_page.dart';

import '../module/app_user.dart';

///Firebase Signup with Email and Password
Future<String> signUp(
    {required BuildContext context,
    required AppUser appUser,
    required String password}) async {
  CustomProgressIndicatorDialog(context: context);
  String response = "";
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: appUser.userEmail, password: password);
    User? user = userCredential.user;
    if (user != null) {

      if (appUser.userType == AppUser.PET_OWNER) {
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
            .set("${appUser.toMap()}");
      }
      user.sendEmailVerification();

      response = "Account Created and Check Your Email To Verify ";
      Navigator.of(context).pop();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(userType:appUser.userType )));
    }else{
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
    {required context, required AppUser appUser, required String password}) async {
  String response = "";
  CustomProgressIndicatorDialog(context: context);
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: appUser.userEmail, password: password );
    User? user = userCredential.user;
    if (user != null) {
      Navigator.of(context).pop();
      if (user.emailVerified) {

        FirebaseHelper.PET_OWNER_DATABASE_REF.ref.onValue.listen((event) {
        AppUser userValue = AppUser.fromJason(event.snapshot.child(user.uid).value);
        print(userValue.userEmail);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainDashboardPage(appUser: userValue)));
        });


      } else {
        response = "Your Email is Not Verified , Kindly Verify and Login Again";
        Navigator.of(context).pop();
      }
    }else{
      Navigator.of(context).pop();
    }
  } on FirebaseAuthException catch (e) {
    Navigator.of(context).pop();
    response = e.code;
  } catch (e) {
    Navigator.of(context).pop();
    response = e.toString();
  }

  return response;
}

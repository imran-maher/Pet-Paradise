import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_paradise/custom_widgets/dailogs.dart';

///Firebase Signup with Email and Password
Future<String> signUp(
    {required BuildContext context,
    required String email,
    required String password}) async {
  CustomProgressIndicatorDialog(context: context);
  String response = "";
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      user.sendEmailVerification();

      response = "Account Created and Check Your Email To Verify ";
    }
  } on FirebaseAuthException catch (e) {

    response = e.code;
  } catch (e) {
    
  }
  Navigator.of(context).pop();
  return response;
}

///Firebase Login with Email and Password
Future<String> login(
    {required context, required String email, required String password}) async {
  String response = "";
  CustomProgressIndicatorDialog(context: context);
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      if (user.emailVerified) {
        response = "Login Success , UUID : ${user.uid}";
        Navigator.of(context).pop();

      } else {
        response = "Your Email is Not Verified , Kindly Verify and Login Again";
        Navigator.of(context).pop();
      }
    }
  } on FirebaseAuthException catch (e) {
    Navigator.of(context).pop();
    response = e.code;
  } catch (e) {
    Navigator.of(context).pop();
    response = e.toString();
  }
  Navigator.of(context).pop();
  return response;
}

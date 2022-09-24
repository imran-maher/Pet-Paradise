

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/utils/colors.dart';

class LoginPageProvider with ChangeNotifier {
  late final loginSuccess;

  late final bool emailFieldIsEmpty;
  late final bool passwordFieldIsEmpty;
  late final String email;
  late final String password;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late final String errorMsg;

  void loginWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    if (email.isEmpty) {
      emailFieldIsEmpty = true;
      notifyListeners();
    } else if (password.isEmpty) {
      passwordFieldIsEmpty = true;
      notifyListeners();
    } else {
      passwordFieldIsEmpty = false;
      emailFieldIsEmpty = false;
      email = email;
      password = password;
      notifyListeners();
      // Login with Email and Password
      try {
        User user = (await auth.signInWithEmailAndPassword(
            email: email, password: password)) as User;

        loginSuccess = true;
        SnackBar snackBar = SnackBar(
          content: Text("Login Success with ${user.email}"),
          backgroundColor: MyColors.LIGHT_GREEN,
          duration: Duration(seconds: 10),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        loginSuccess = false;
        errorMsg = e.code;
        SnackBar snackBar = SnackBar(
          content: Text("Login Failed with Error Code ${e.code}"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 10),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      }
    }
  }
}

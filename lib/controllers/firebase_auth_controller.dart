
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class LoginWithEmailAndPassword {
  late final String _email;
  late final String _password;
  late final FirebaseAuth _auth;

  LoginWithEmailAndPassword.init(
      {required String email, required String password}){
    this._auth = FirebaseAuth.instance;
    this._email = email;
    this._password = password;
  }

  login(BuildContext context) async {
    try {
      UserCredential credential
      = await this._auth.signInWithEmailAndPassword(
          email: this._email, password: this._password).whenComplete(() =>
          print("Login"));








    } catch (e) {
      print(e.toString());
    }
  }

  signUp(BuildContext context) async {
    UserCredential credential = await this._auth.createUserWithEmailAndPassword(
        email: this._email, password: this._password);
    if(credential.user != null){
      credential.user?.sendEmailVerification();
      print("Verification mail send to $_email");
    }else{
      print(credential.user?.uid);
    }
    credential.user!.linkWithPhoneNumber("+923016557355" ,);
  }
}

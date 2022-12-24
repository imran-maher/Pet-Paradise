import 'dart:async';

import 'package:flutter/material.dart';

class VerificationCodeProvider extends ChangeNotifier {
  int _remainingTime = 60;
  String _msg = "Resend code in";
  bool _resendCodeEnabled = false;

  int get remainingTime => _remainingTime;
  String get msg => _msg;
  bool get resendCodeEnable => _resendCodeEnabled;

  set remainingTime(int time) {
    this._remainingTime = time;
    notifyListeners();
  }

  void resetTime() {
    counter();
    this._remainingTime = 60;
    //counter();

  }

  void counter() {
    Timer(Duration(seconds: 1), () {
      if (_remainingTime >= 0) {
        if(_remainingTime == 0){
          _msg = "Resend Code";
          _resendCodeEnabled = true;
          notifyListeners();

        }else{
          _remainingTime = _remainingTime - 1;
          _msg = "Resend code in $_remainingTime";
          _resendCodeEnabled = false;
          notifyListeners();
        }


      }

    });
  }
}

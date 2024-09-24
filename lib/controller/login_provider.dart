import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/services/helpers/auth_helper.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool _firstTime = true;
  bool get firstTime => _firstTime;

  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }

  bool? _entrypoint;

  bool get entrypoint => _entrypoint ?? false;

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  bool? _isReservedFrmLogin;

  bool get isReservedFrmLogin => _isReservedFrmLogin ?? false;

  set isReservedFrmLogin(bool newState) {
    _isReservedFrmLogin = newState;
    notifyListeners();
  }

  logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: "Logging Out...");
    await prefs.clear();
    _firstTime = false;
    isVerified = false;
    prefs.setBool('loggedIn', false);
    prefs.setBool('entrypoint', false);
    EasyLoading.dismiss();
    Get.off(() => SignInScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500));
  }

  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;

  set isVerified(bool newState) {
    _isVerified = newState;
    notifyListeners();
  }

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    entrypoint = prefs.getBool('entrypoint') ?? false;
    loggedIn = prefs.getBool('loggedIn') ?? false;
    isVerified = prefs.getBool('isVerified') ?? false;
  }
}

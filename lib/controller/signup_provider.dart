import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/models/corporate_model.dart';
import 'package:orc_public/models/individual_model.dart';
import 'package:orc_public/services/helpers/auth_helper.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:orc_public/view/feature/authentication/verification_otp.dart';

class SignupNotifier extends ChangeNotifier {
  final indiSignUpFormKey = GlobalKey<FormState>();
  final corpSignUpFormKey = GlobalKey<FormState>();
  bool validateAndSave() {
    final form = indiSignUpFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool validateAndSaveCorp() {
    final form = corpSignUpFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  individualSignUp(IndividualModel model) {
    EasyLoading.show(
      status: 'Loading...',
    );
    AuthHelper.individualSignUp(model).then((response) {
      if (response == 'success') {
        Get.off(
            () => OtpScreen(
                  email: model.email,
                ),
            transition: Transition.fade,
            duration: const Duration(seconds: 2));
        EasyLoading.dismiss();
      } else {
        Get.snackbar('Sign up failed', "$response",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: Icon(IconlyBold.danger));
        EasyLoading.dismiss();
      }
    });
  }

  corporateSignUp(CorporateModel model) {
    EasyLoading.show(
      status: 'Loading...',
    );
    AuthHelper.corporateSignUp(model).then((response) {
      if (response == 'success') {
        Get.off(
            () => OtpScreen(
                  email: model.email,
                ),
            transition: Transition.fade,
            duration: const Duration(seconds: 2));
        EasyLoading.dismiss();
      } else {
        Get.snackbar('Sign up failed', "$response",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: Icon(IconlyBold.danger));
        EasyLoading.dismiss();
      }
    });
  }
}

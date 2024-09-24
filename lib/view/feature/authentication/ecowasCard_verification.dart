import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/services/helpers/auth_helper.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/authentication/ecowasCard_verification_Form.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants/app_images.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/authWedget.dart';
import '../../../utils/widgets/customButton.dart';

class EcowasCardVerification extends StatefulWidget {
  const EcowasCardVerification({super.key});

  @override
  State<EcowasCardVerification> createState() => _EcowasCardVerificationState();
}

class _EcowasCardVerificationState extends State<EcowasCardVerification> {
  final idNumberController = TextEditingController();
  static final ecowasForm = GlobalKey<FormState>();

  bool isValidFormat(String input) {
    final pattern = r'^GHA-\d{9}-\d$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.background
          : theme.backgroundColor,
      appBar: AppBar(
          elevation: 1,
          backgroundColor: theme.backgroundColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Image.asset(
            AppImages.orcLogo,
            height: 60,
          )),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        padding:
            const EdgeInsets.only(left: 20, top: 13, right: 20, bottom: 13),
        child: Form(
            key: ecowasForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.08.sh),
                  child: AppText(
                    text: 'Ecowas Card Verification Process',
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    textOverflow: TextOverflow.visible,
                    weight: FontWeight.w600,
                    textColor: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                AppText(
                  text: 'Please Enter your ID Number of your Ecowas Card',
                  textAlign: TextAlign.center,
                  fontSize: 12,
                  textOverflow: TextOverflow.visible,
                  weight: FontWeight.w400,
                  textColor: Colors.black45,
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                CustomTextField(
                  controller: idNumberController,
                  hintext: 'GHA-123456789-0',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !isValidFormat(value)) {
                      return 'Please enter a valid GhanaCard Number';
                    } else {
                      return null;
                    }
                  },
                  lable: 'ID Number',
                  isForm: false,
                ),
                SizedBox(
                  height: 0.08.sh,
                ),
                CustomButton(
                    press: () {
                      if (ecowasForm.currentState!.validate()) {
                        EasyLoading.show(status: 'Verifying...');

                        // AuthHelper.verifyAccount(idNumberController.text)
                        //     .then((response) {
                        //   if (response == 'success') {
                        //     EasyLoading.dismiss();
                        //     Get.to(() => Dashboard());
                        //   } else {
                        //     EasyLoading.dismiss();
                        //     Get.snackbar('Verification failed', "$response",
                        //         backgroundColor: Colors.red,
                        //         colorText: Colors.white,
                        //         icon: Icon(IconlyBold.danger));
                        //   }
                        // });

                        Timer(Duration(seconds: 5), () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          EasyLoading.dismiss();
                          await prefs.setBool('isVerified', true);
                          Get.snackbar('Account Verified',
                              "Account verified successfully",
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              icon: Icon(IconlyBold.shield_done));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        });
                      }
                    },
                    deviceWidth: double.infinity,
                    deviceHeight: 50,
                    rad: 10,
                    size: 14,
                    color: theme.secondaryColor ?? Colors.white,
                    title: 'Verify Ecowas Card'),
                SizedBox(
                  height: 0.02.sh,
                ),
                CustomButton(
                    press: () {
                      Get.to(() => Dashboard());
                    },
                    deviceWidth: double.infinity,
                    deviceHeight: 50,
                    hasBorder: true,
                    rad: 10,
                    size: 14,
                    color: Colors.white,
                    textColor: Colors.black87,
                    title: 'Proceed without verification'),
              ],
            )),
      ),
    );
  }
}

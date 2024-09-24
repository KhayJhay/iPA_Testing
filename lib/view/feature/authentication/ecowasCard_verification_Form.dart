import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orc_public/controller/login_provider.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/date_picker_field.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_images.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/authWedget.dart';
import '../../../utils/widgets/customButton.dart';

class EcowasCardVerificationForm extends StatefulWidget {
  const EcowasCardVerificationForm({super.key});

  @override
  State<EcowasCardVerificationForm> createState() =>
      _EcowasCardVerificationFormState();
}

class _EcowasCardVerificationFormState
    extends State<EcowasCardVerificationForm> {
  final docNumberController = TextEditingController();

  final motherNameController = TextEditingController();
  static final ecowasFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context);
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
            key: ecowasFormKey,
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
                  text:
                      'Please provide this necessary info to confirm your Ecowas Card details',
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
                  controller: docNumberController,
                  hintext: 'Confirm Document Number',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Document Number',
                  isForm: false,
                ),
                DatePickerField(lable: 'Confirm Date of Birth'),
                CustomTextField(
                  controller: motherNameController,
                  hintext: "Enter your mother's name",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Confirm your mothers name',
                  isForm: false,
                ),
                SizedBox(
                  height: 0.08.sh,
                ),
                CustomButton(
                    press: () {
                      if (ecowasFormKey.currentState!.validate()) {
                        EasyLoading.show(status: 'Verifying...');
                        Timer(Duration(seconds: 10), () {
                          setState(() {
                            loginNotifier.isVerified = true;
                          });
                          EasyLoading.dismiss();
                          Get.to(() => Dashboard());
                        });
                      }
                    },
                    deviceWidth: double.infinity,
                    deviceHeight: 50,
                    rad: 10,
                    size: 14,
                    color: theme.secondaryColor ?? Colors.white,
                    title: 'Continue'),
              ],
            )),
      ),
    );
  }
}

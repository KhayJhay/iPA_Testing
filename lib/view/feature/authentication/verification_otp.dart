import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/services/helpers/auth_helper.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/view/feature/authentication/ecowasCard_verification.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/name_reg_payment.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_reservation/reservation_payment.dart';
import 'package:orc_public/view/feature/dashboard/pages/registration_services/registration_services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/login_provider.dart';
import '../../../utils/constants/color_constant.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/customButton.dart';
import 'package:sms_consent_for_otp_autofill/sms_consent_for_otp_autofill.dart';

class OtpScreen extends StatefulWidget {
  String? email;

  OtpScreen({super.key, this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpText = TextEditingController();
  var getToken = '';
  bool isLoading = false;
  bool isResendActive = false; // Add this line
  int timer = 180; // 3 minutes in seconds
  static final otpForm = GlobalKey<FormState>();
  Timer? _timer;
  late SmsConsentForOtpAutofill smsConsentForOtpAutoFill;
  late SharedPreferences prefs;
  late bool isReserved;
  late bool isRegister;
  String regNname = '';

  @override
  void initState() {
    super.initState();

    startTimer();
    _initPrefs();
    smsConsentForOtpAutoFill =
        SmsConsentForOtpAutofill(phoneNumberListener: (number) {
      widget.email = number;
    }, smsListener: (smsMessage) {
      // Use a regular expression to extract the last 4 digits from the SMS message
      final RegExp regExp = RegExp(r'\d{5}');
      final String? otpCode = regExp.firstMatch(smsMessage)?.group(0);

      if (otpCode != null) {
        otpText.text = otpCode;
        print("OTP code found in the message $otpCode");
      } else {
        print("No OTP code found in the message.");
      }
    });
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    isReserved = prefs.getBool('isReserved') ?? false;
    isRegister = prefs.getBool('isRegister') ?? false;
    regNname = prefs.getString('bussName') ?? '';
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (this.timer > 0) {
          this.timer--;
        } else {
          timer.cancel();
          isResendActive = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Add this line
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context);
    return Scaffold(
        backgroundColor: theme.backgroundColor,
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
              key: otpForm,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.08.sh),
                      child: AppText(
                        text: 'OTP Code Verification',
                        textAlign: TextAlign.center,
                        fontSize: 14,
                        textOverflow: TextOverflow.visible,
                        weight: FontWeight.w600,
                        textColor: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 17, left: 50, right: 50),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          const TextSpan(
                            text: 'Enter the verification code sent to',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: ' ${widget.email} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const TextSpan(
                            text: 'to login.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const TextSpan(
                            text: ' Change number ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 42),
                        child: PinCodeTextField(
                            appContext: context,
                            controller: otpText,
                            length: 5,
                            obscureText: false,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.number,
                            autoDismissKeyboard: true,
                            enableActiveFill: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please this field is required");
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {
                              if (value.length == 5) {
                                if (widget.email!.contains('@')) {
                                  EasyLoading.show(status: 'Loading...');
                                  AuthHelper.verifyOtp(widget.email ?? '', '',
                                          otpText.text, true)
                                      .then((response) {
                                    if (response == 'success') {
                                      EasyLoading.dismiss();
                                      !loginNotifier.isVerified
                                          ? Get.off(
                                              () => isReserved
                                                  ? const Reservation_Payment()
                                                  : isRegister
                                                      ? RegistrationServices()
                                                      : Dashboard(),
                                              transition: Transition.fade,
                                              duration:
                                                  const Duration(seconds: 2))
                                          : Get.off(
                                              () => isReserved
                                                  ? const Reservation_Payment()
                                                  : isRegister
                                                      ? RegistrationServices()
                                                      : Dashboard(),
                                              transition: Transition.fade,
                                              duration:
                                                  const Duration(seconds: 2));
                                    } else {
                                      EasyLoading.dismiss();
                                      Get.snackbar(
                                          'Verification failed', "$response",
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          icon: Icon(IconlyBold.danger));
                                    }
                                  });
                                } else {
                                  EasyLoading.show(status: 'Loading...');
                                  AuthHelper.verifyOtp('', widget.email ?? '',
                                          otpText.text, false)
                                      .then((response) {
                                    if (response == 'success') {
                                      EasyLoading.dismiss();
                                      !loginNotifier.isVerified
                                          ? Get.off(
                                              () => isReserved
                                                  ? const Reservation_Payment()
                                                  : isRegister
                                                      ? RegistrationServices()
                                                      : Dashboard(),
                                              transition: Transition.fade,
                                              duration:
                                                  const Duration(seconds: 2))
                                          : Get.off(
                                              () => isReserved
                                                  ? const Reservation_Payment()
                                                  : isRegister
                                                      ? RegistrationServices()
                                                      : Dashboard(),
                                              transition: Transition.fade,
                                              duration:
                                                  const Duration(seconds: 2));
                                    } else {
                                      EasyLoading.dismiss();
                                      Get.snackbar(
                                          'Verification failed', "$response",
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white,
                                          icon: Icon(IconlyBold.danger));
                                    }
                                  });
                                }
                              }
                            },
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700),
                            pinTheme: PinTheme(
                                fieldHeight: 55,
                                fieldWidth: 55,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(15),
                                selectedFillColor: ColorConstant.indigo60014,
                                activeFillColor: ColorConstant.indigo60014,
                                inactiveFillColor: ColorConstant.indigo60014,
                                inactiveColor:
                                    ColorConstant.fromHex("#1212121D"),
                                selectedColor:
                                    ColorConstant.fromHex("#1212121D"),
                                activeColor:
                                    ColorConstant.fromHex("#1212121D")))),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        deviceWidth: double.infinity,
                        deviceHeight: 50,
                        rad: 15,
                        size: 14,
                        color: theme.primaryColor ?? Colors.white,
                        press: () {
                          if (otpForm.currentState!.validate()) {
                            if (widget.email!.contains('@')) {
                              EasyLoading.show(status: 'Loading...');
                              AuthHelper.verifyOtp(widget.email ?? '', '',
                                      otpText.text, true)
                                  .then((response) {
                                if (response == 'success') {
                                  EasyLoading.dismiss();
                                  !loginNotifier.isVerified
                                      ? Get.off(
                                          () => const EcowasCardVerification(),
                                          transition: Transition.fade,
                                          duration: const Duration(seconds: 2))
                                      : Get.off(() => Dashboard(),
                                          transition: Transition.fade,
                                          duration: const Duration(seconds: 2));
                                } else {
                                  EasyLoading.dismiss();
                                  Get.snackbar(
                                      'Verification failed', "$response",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      icon: Icon(IconlyBold.danger));
                                }
                              });
                            } else {
                              EasyLoading.show(status: 'Loading...');
                              AuthHelper.verifyOtp('', widget.email ?? '',
                                      otpText.text, false)
                                  .then((response) {
                                if (response == 'success') {
                                  EasyLoading.dismiss();
                                  !loginNotifier.isVerified
                                      ? Get.off(
                                          () => const EcowasCardVerification(),
                                          transition: Transition.fade,
                                          duration: const Duration(seconds: 2))
                                      : Get.off(() => Dashboard(),
                                          transition: Transition.fade,
                                          duration: const Duration(seconds: 2));
                                } else {
                                  EasyLoading.dismiss();
                                  Get.snackbar(
                                      'Verification failed', "$response",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      icon: Icon(IconlyBold.danger));
                                }
                              });
                            }
                          }
                        },
                        title: 'Verify Account'),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Didn't receive any code?",
                                overflow: TextOverflow.visible,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                '${timer ~/ 60}:${(timer % 60).toString().padLeft(2, '0')}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        )),
                    Center(
                      child: TextButton(
                          onPressed: isResendActive ? () {} : null,
                          child: Text(
                            'Resend Code',
                            style: TextStyle(
                                color: isResendActive
                                    ? theme.secondaryColor
                                    : Colors.blueGrey.shade300,
                                fontSize: 16,
                                fontFamily: 'Poppins-SemiBold'),
                          )),
                    ),
                  ]),
            )));
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/services/helpers/auth_helper.dart';
import 'package:orc_public/services/sms_api.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/authentication/non_ghanaian_sign_up.dart';
import 'package:orc_public/view/feature/authentication/sign_up.dart';
import 'package:orc_public/view/feature/authentication/verification_otp.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/signup_provider.dart';
import '../../../models/dummy_user_model.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/authWedget.dart';
import '../../../utils/widgets/customButton.dart';
import '../../../utils/widgets/numberTextField.dart';
import '../onboarding/basic_name_search.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final signInformKey = GlobalKey<FormState>();
  bool isEmail = false;
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  String phoneNumber = '';
  final idNumberController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    loadSampleData();
  }

  Future<void> loadSampleData() async {
    String data = await rootBundle.loadString('assets/lotties/sampleData.json');
    Map<String, dynamic> jsonData = json.decode(data);
    setState(() {
      users = jsonData['users'];
    });
  }

  void login() {
    if (signInformKey.currentState!.validate()) {
      EasyLoading.show(status: 'Verifying...');
      String enteredCard = idNumberController.text;
      for (var user in users) {
        Timer(Duration(seconds: 3), () {
          if (user['userDetails']['card'] == enteredCard) {
            print(user['userDetails']['phoneNumber']);
            EasyLoading.dismiss();
            loginOtp(
                emailController.text, user['userDetails']['phoneNumber'], true);
          }
        });
      }
    }
  }

  bool isValidFormat(String input) {
    final pattern = r'^GHA-\d{7}-\d$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Consumer<SignupNotifier>(builder: (context, signupNotifier, child) {
      return Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: signInformKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.09.sh,
                            ),
                            Image.asset(
                              AppImages.orcLogo,
                              height: 120,
                            ),
                            AppText(
                              text: 'Login Account',
                              textAlign: TextAlign.center,
                              fontSize: 18,
                              textOverflow: TextOverflow.visible,
                              weight: FontWeight.w600,
                              textColor: Colors.black87,
                            ),
                            SizedBox(
                              height: 0.020.sh,
                            ),
                            AppText(
                              text: 'Hello, Please login to continue',
                              textAlign: TextAlign.center,
                              fontSize: 13,
                              textOverflow: TextOverflow.visible,
                              weight: FontWeight.w400,
                              textColor: Colors.black87,
                            ),
                            SizedBox(
                              height: 0.015.sh,
                            ),
                            // isEmail
                            //     ? NumberTextField(
                            //         number: number,
                            //         contactController: contactController,
                            //         lable: 'Phone Number',
                            //         onInputChanged: (number) {
                            //           phoneNumber = number!.phoneNumber ?? '';
                            //         },
                            //       )
                            //     : CustomTextField(
                            //         controller: emailController,
                            //         hintext: 'eg.johndoe@gmail.com',
                            //         keyboardType: TextInputType.emailAddress,
                            //         validator: (email) {
                            //           if (email!.isEmpty ||
                            //               !email.contains('@')) {
                            //             return 'Please enter a valid email';
                            //           } else {
                            //             return null;
                            //           }
                            //         },
                            //         lable: 'Your Email'),
                            isEmail
                                ? CustomTextField(
                                    controller: cinController,
                                    hintext: 'Enter Company Info Number',
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (cin) {
                                      if (cin!.isEmpty) {
                                        return 'Please enter CIN umber';
                                      } else {
                                        return null;
                                      }
                                    },
                                    lable: 'CIN')
                                : CustomTextField(
                                    controller: idNumberController,
                                    hintext: 'GHA-123456789-0',
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !isValidFormat(value)) {
                                        return 'Please enter a valid GhanaCard Number';
                                      } else {
                                        return null;
                                      }
                                    },
                                    lable: 'Ghana Card Number',
                                    isForm: false,
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  isEmail
                                      ? "Sign in as Individual?"
                                      : "Sign in as Corporate?",
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14),
                                ),
                                Transform.scale(
                                  scale: 0.9,
                                  child: Switch.adaptive(
                                      activeColor: theme.primaryColor,
                                      value: isEmail,
                                      onChanged: (isEmail) {
                                        setState(() => this.isEmail = isEmail);
                                      }),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 0.018.sh,
                            ),
                            CustomButton(
                                deviceWidth: double.infinity,
                                deviceHeight: 50,
                                rad: 15,
                                color: theme.primaryColor ?? Colors.white,
                                press: login,
                                // press: () async {
                                //   // final SharedPreferences prefs =
                                //   //     await SharedPreferences.getInstance();
                                //   // await prefs.setBool('entrypoint', true);
                                //   // if (signInformKey.currentState!.validate()) {
                                //   //   loginOtp(
                                //   //       emailController.text,
                                //   //       phoneNumber.replaceFirst('+', ''),
                                //   //       isEmail);
                                //   // }
                                //   // if (signInformKey.currentState!.validate()) {
                                //   //   EasyLoading.show(status: 'Please wait...');
                                //   //   Timer(Duration(seconds: 3), () {
                                //   //     final user = findUserByCard(
                                //   //         idNumberController.text);
                                //   //     print("USER DATA${jsonEncode(user)}");
                                //   //     if (user != null) {
                                //   //       EasyLoading.dismiss();
                                //   //       Get.snackbar('Success',
                                //   //           "yoo've logged in successfully",
                                //   //           backgroundColor: Colors.green,
                                //   //           colorText: Colors.white,
                                //   //           icon: Icon(IconlyBold.shield_done));
                                //   //       Navigator.push(
                                //   //           context,
                                //   //           MaterialPageRoute(
                                //   //               builder: (context) =>
                                //   //                   Dashboard()));
                                //   //     } else {
                                //   //       EasyLoading.dismiss();
                                //   //       Get.snackbar('Oooops',
                                //   //           "Login failed, please try again",
                                //   //           backgroundColor: Colors.red,
                                //   //           colorText: Colors.white,
                                //   //           icon: Icon(IconlyBold.shield_done));
                                //   //     }
                                //   //   });
                                //   // }
                                // },
                                title: 'Login'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(SignUpScreen());
                                  },
                                  child: AppText(
                                    text: 'SignUp',
                                    textAlign: TextAlign.center,
                                    fontSize: 14,
                                    textOverflow: TextOverflow.visible,
                                    weight: FontWeight.w600,
                                    textColor:
                                        theme.primaryColor ?? Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/png/Line 6.png',
                                    width: 0.3.sw,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'Poppins-Bold',
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/png/Line 5.png',
                                    width: 0.3.sw,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.015.sh,
                            ),
                            CustomButton(
                                deviceWidth: double.infinity,
                                deviceHeight: 55,
                                rad: 15,
                                color: const Color.fromARGB(255, 253, 253, 254),
                                textColor: Colors.black,
                                hasBorder: true,
                                size: 14,
                                prefix: Image.asset(
                                  'assets/png/int.png',
                                  height: 27,
                                ),
                                press: () {
                                  Get.to(NonGhanaianSignUp());
                                },
                                title: 'Continue as a Non-Ghanaian'),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            CustomButton(
                                deviceWidth: double.infinity,
                                deviceHeight: 55,
                                rad: 15,
                                color: const Color.fromARGB(255, 253, 253, 254),
                                textColor: Colors.black,
                                hasBorder: true,
                                size: 14,
                                prefix: Icon(
                                  IconlyLight.search,
                                  size: 24,
                                ),
                                press: () {
                                  showSearchBottomSheet(context);
                                },
                                title: 'Basic Name Search'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }

  void loginOtp(email, phone, bool isMail) {
    EasyLoading.show(status: 'Loading...');

    AuthHelper.login(email, phone, isMail).then((response) {
      if (response == 'success') {
        Get.off(
            () => OtpScreen(
                  email: isMail ? phone : email,
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

  void showSearchBottomSheet(
    BuildContext context,
  ) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    final searchController = TextEditingController();
    final description = TextEditingController();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              height: 0.4.sh,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0xFFF9FAFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: AppText(
                      text: 'Basic Name Search',
                      weight: FontWeight.w800,
                      fontSize: 18.sp,
                      textColor: Colors.black,
                    ),
                  ),
                  AppText(
                    text:
                        "This search helps you know if your intended business name is'nt taken or in use",
                    weight: FontWeight.w400,
                    fontSize: 10.sp,
                    textAlign: TextAlign.left,
                    textOverflow: TextOverflow.visible,
                    textColor: Colors.black54,
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  CustomTextField(
                      controller: searchController,
                      hintext: 'eg.Big Ben LTD',
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Search field is empty';
                        } else {
                          return null;
                        }
                      },
                      lable: 'Business Name'),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  CustomButton(
                      deviceWidth: double.infinity,
                      deviceHeight: 55,
                      rad: 10,
                      color: theme.secondaryColor ?? Colors.white,
                      textColor: Colors.white,
                      size: 14,
                      press: () {
                        Get.to(Bbasic_Name_Search(
                          isFromLogin: true,
                          searchedName: searchController.text,
                        ));
                      },
                      title: 'Search'),
                ],
              )),
        );
      },
      isScrollControlled: true,
    );
  }
}

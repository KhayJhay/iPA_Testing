import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/models/corporate_model.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:orc_public/view/feature/authentication/verification_otp.dart';

import 'package:provider/provider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../controller/signup_provider.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/authWedget.dart';
import '../../../utils/widgets/customButton.dart';
import '../../../utils/widgets/numberTextField.dart';

class CorpSignUpScreen extends StatefulWidget {
  @override
  State<CorpSignUpScreen> createState() => _CorpSignUpScreenState();
}

class _CorpSignUpScreenState extends State<CorpSignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Consumer<SignupNotifier>(builder: (context, signupNotifier, child) {
      return Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: signupNotifier.corpSignUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              CupertinoIcons.chevron_left_circle_fill,
                              size: 32,
                              color: theme.primaryColor,
                            )),
                        TextButton(
                            onPressed: () {},
                            child: AppText(
                              text: 'Need Assistance?',
                              fontSize: 14,
                              textColor:
                                  const Color.fromARGB(255, 47, 130, 129),
                              weight: FontWeight.w400,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SizedBox(
                        height: _height,
                        child: ListView(children: [
                          Image.asset(
                            AppImages.orcLogo,
                            height: 120,
                          ),
                          AppText(
                            text: 'Create a Corporate Account',
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
                            text:
                                'Hello, Please Sign up with your email to get started',
                            textAlign: TextAlign.center,
                            fontSize: 13,
                            textOverflow: TextOverflow.visible,
                            weight: FontWeight.w400,
                            textColor: Colors.black87,
                          ),
                          SizedBox(
                            height: 0.015.sh,
                          ),
                          CustomTextField(
                              controller: emailController,
                              hintext: 'eg.johndoe@gmail.com',
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email!.isEmpty || !email.contains('@')) {
                                  return 'Please enter a valid email';
                                } else {
                                  return null;
                                }
                              },
                              lable: 'Your Email'),
                          CustomTextField(
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
                              lable: 'CIN'),
                          NumberTextField(
                            number: number,
                            contactController: contactController,
                            lable: 'Company Contact',
                            onInputChanged: (number) {
                              phoneNumber = number!.phoneNumber ?? '';
                            },
                          ),
                          SizedBox(
                            height: 0.018.sh,
                          ),
                          CustomButton(
                              deviceWidth: double.infinity,
                              deviceHeight: 50,
                              rad: 15,
                              color: theme.primaryColor ?? Colors.white,
                              press: () {
                                if (signupNotifier.validateAndSaveCorp()) {
                                  CorporateModel model = CorporateModel(
                                      email: emailController.text,
                                      phoneNumber:
                                          phoneNumber.replaceFirst('+', ''),
                                      cin: cinController.text);
                                  signupNotifier.corporateSignUp(model);
                                } else {
                                  Get.snackbar('Sign up failed',
                                      "Please check your credentials",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      icon: Icon(IconlyBold.danger));
                                }
                              },
                              title: 'Get Started'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                overflow: TextOverflow.visible,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.off(() => SignInScreen(),
                                      transition: Transition.fade,
                                      duration: const Duration(seconds: 2));
                                },
                                child: AppText(
                                  text: 'Sign In',
                                  textAlign: TextAlign.center,
                                  fontSize: 14,
                                  textOverflow: TextOverflow.visible,
                                  weight: FontWeight.w600,
                                  textColor: theme.primaryColor ?? Colors.black,
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/controller/login_provider.dart';
import 'package:orc_public/models/individual_model.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/authentication/corporate_account.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:orc_public/view/feature/authentication/verification_otp.dart';

import 'package:provider/provider.dart';

import '../../../controller/signup_provider.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/authWedget.dart';
import '../../../utils/widgets/customButton.dart';
import '../../../utils/widgets/numberTextField.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String phoneNumber = '';
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Consumer<SignupNotifier>(builder: (context, signupNotifier, child) {
      return Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: signupNotifier.indiSignUpFormKey,
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
                            text: 'Create an Individual Account',
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
                          NumberTextField(
                            number: number,
                            contactController: contactController,
                            lable: 'Phone Number',
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
                                loginNotifier.firstTime =
                                    !loginNotifier.firstTime;
                                if (signupNotifier.validateAndSave()) {
                                  IndividualModel model = IndividualModel(
                                      email: emailController.text,
                                      phoneNumber:
                                          phoneNumber.replaceFirst('+', ''));
                                  signupNotifier.individualSignUp(model);
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
                                "Sign in as corporate?",
                                overflow: TextOverflow.visible,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 14),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(CorpSignUpScreen());
                                },
                                child: AppText(
                                  text: 'Corporate SignUp',
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

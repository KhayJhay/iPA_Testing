import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/date_picker_field.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:orc_public/view/feature/authentication/verification_otp.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../controller/signup_provider.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/authWedget.dart';
import '../../../utils/widgets/customButton.dart';
import '../../../utils/widgets/numberTextField.dart';

class NonGhanaianSignUp extends StatefulWidget {
  @override
  State<NonGhanaianSignUp> createState() => _NonGhanaianSignUpState();
}

class _NonGhanaianSignUpState extends State<NonGhanaianSignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  DateTime? selectedDate;
  final signUpformKey = GlobalKey<FormState>();
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  int _currentPageIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    if (_currentPageIndex < 2) {
      _currentPageIndex++;
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToPreviousPage() {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutBack,
      );
    }
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
              child: Form(
                key: signUpformKey,
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
                      child: ListView(shrinkWrap: true, children: [
                        Image.asset(
                          AppImages.orcLogo,
                          height: 120,
                        ),
                        AppText(
                          text: 'Non-Ghanaian SignUp',
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
                              'Hello, Please Fill in fields below to get started',
                          textAlign: TextAlign.center,
                          fontSize: 13,
                          textOverflow: TextOverflow.visible,
                          weight: FontWeight.w400,
                          textColor: Colors.black87,
                        ),
                        SizedBox(
                          height: 0.015.sh,
                        ),
                        ExpandablePageView(
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          children: [
                            buildSecondForm(),
                            buildThirdForm(),
                          ],
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        _currentPageIndex > 0
                            ? _currentPageIndex == 1
                                ? CustomButton(
                                    deviceWidth: double.infinity,
                                    deviceHeight: 50,
                                    rad: 15,
                                    color: theme.primaryColor ?? Colors.white,
                                    press: () {
                                      // if (signUpformKey.currentState!.validate()) {
                                      //   Get.to(OtpScreen(
                                      //     email: emailController.text,
                                      //   ));
                                      // }
                                    },
                                    title: 'Submit')
                                : Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                            deviceWidth: double.infinity,
                                            deviceHeight: 50,
                                            rad: 15,
                                            color: theme.secondaryColor ??
                                                Colors.white,
                                            press: () {
                                              // if (signUpformKey.currentState!.validate()) {
                                              //   Get.to(OtpScreen(
                                              //     email: emailController.text,
                                              //   ));
                                              // }
                                              _navigateToPreviousPage();
                                            },
                                            title: 'Back'),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                            deviceWidth: double.infinity,
                                            deviceHeight: 50,
                                            rad: 15,
                                            color: theme.primaryColor ??
                                                Colors.white,
                                            press: () {
                                              // if (signUpformKey.currentState!.validate()) {
                                              //   Get.to(OtpScreen(
                                              //     email: emailController.text,
                                              //   ));
                                              // }
                                              _navigateToNextPage();
                                            },
                                            title: 'Next'),
                                      ),
                                    ],
                                  )
                            : CustomButton(
                                deviceWidth: double.infinity,
                                deviceHeight: 50,
                                rad: 15,
                                color: theme.primaryColor ?? Colors.white,
                                press: () {
                                  // if (signUpformKey.currentState!.validate()) {
                                  //   Get.to(OtpScreen(
                                  //     email: emailController.text,
                                  //   ));
                                  // }
                                  _navigateToNextPage();
                                },
                                title: 'Next'),
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
                                Get.to(SignInScreen());
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
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Widget buildFirstForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Representative Details',
          textAlign: TextAlign.center,
          fontSize: 15,
          textOverflow: TextOverflow.visible,
          weight: FontWeight.w600,
          textColor: Colors.black87,
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 0.4.sh,
          child: ListView(
            children: [
              CustomTextField(
                  controller: emailController,
                  hintext: 'Enter Surname',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Surname'),
              CustomTextField(
                  controller: emailController,
                  hintext: 'Enter First Name',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'First Name'),
              CustomTextField(
                  controller: emailController,
                  hintext: 'Ennter Other Name',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Other Name'),
              Row(
                children: [
                  Expanded(
                    child: DatePickerField(
                      lable: 'Date of Birth',
                      selectedDate: selectedDate,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: cinController,
                        hintext: 'Male',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty || !email.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Gender'),
                  ),
                ],
              ),
              CustomTextField(
                  controller: cinController,
                  hintext: 'Nationality',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Nationality'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSecondForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Personal Details',
          textAlign: TextAlign.center,
          fontSize: 15,
          textOverflow: TextOverflow.visible,
          weight: FontWeight.w600,
          textColor: Colors.black87,
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 0.4.sh,
          child: ListView(
            children: [
              NumberTextField(
                number: number,
                contactController: contactController,
                lable: 'Phone Number',
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
                  lable: 'Confirm Email'),
              CustomTextField(
                  controller: cinController,
                  hintext: 'Enter Occupation',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Occupation'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildThirdForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: 'Address & ID Details',
          textAlign: TextAlign.center,
          fontSize: 15,
          textOverflow: TextOverflow.visible,
          weight: FontWeight.w600,
          textColor: Colors.black87,
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 0.4.sh,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: emailController,
                        hintext: 'Select Country',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty || !email.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Country'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: emailController,
                        hintext: 'Select State',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty || !email.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        lable: 'State'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: emailController,
                        hintext: 'Enter City',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty || !email.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        lable: 'City'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: emailController,
                        hintext: 'Enter House Number',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty || !email.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        lable: 'House Number'),
                  ),
                ],
              ),
              CustomTextField(
                  controller: emailController,
                  hintext: 'Enter Street Name',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Street Name'),
              SizedBox(
                height: 15,
              ),
              AppText(
                text: 'Identification Documents',
                textAlign: TextAlign.center,
                fontSize: 15,
                textOverflow: TextOverflow.visible,
                weight: FontWeight.w600,
                textColor: Colors.black87,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                  controller: emailController,
                  hintext: 'Select  ID type',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'ID Type'),
              CustomTextField(
                  controller: emailController,
                  hintext: 'Enter ID Number',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  lable: 'ID Number'),
            ],
          ),
        ),
      ],
    );
  }
}

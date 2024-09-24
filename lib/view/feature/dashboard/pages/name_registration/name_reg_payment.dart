import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/entity_Card.dart';
import 'package:orc_public/utils/widgets/menuCardList.dart';
import 'package:orc_public/utils/widgets/nameCard.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/name_registration.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/professional_bodies.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/authWedget.dart';
import '../../../../../utils/widgets/customButton.dart';
import '../../../../../utils/widgets/custom_appBar.dart';
import '../../../../../utils/widgets/numberTextField.dart';

class Name_Reg_Payment extends StatefulWidget {
  String title;
  Name_Reg_Payment({super.key, this.title = ''});

  @override
  State<Name_Reg_Payment> createState() => _Name_Reg_PaymentState();
}

class _Name_Reg_PaymentState extends State<Name_Reg_Payment> {
  int current = 0;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String selectedPayment = '';
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  String phoneNumber = '';
  late SharedPreferences prefs;
  bool isRegister = false;
  String regName = '';

  final List<String> paymentMethod = [
    'MTN Momo',
    'Telecel Cash',
    'AirtelTigo Money',
    'Visa Card',
  ];

  List<String> payDesc = [
    "Use MTN momo to process paymnet",
    "Use Telecel Cash to process payment",
    "Use AirtelTigo Money to process payment",
    "Use your Credit Card to process payment",
  ];

  List<String> imgUrls = [
    AppImages.mtn,
    AppImages.telecel,
    AppImages.airtelTigo,
    AppImages.visa,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    isRegister = prefs.getBool('isRegister') ?? false;
    regName = prefs.getString('bussName') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Make Payment',
            hasBackbtn: true,
            hasAction: true,
            backBtn: isRegister
                ? () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isRegister', false);
                    quitAlert(context);
                  }
                : () {
                    Navigator.pop(context);
                  },
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: 'Please select a payment method',
                  fontSize: 14,
                  textOverflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  textColor: Colors.black87,
                  weight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                    paymentMethod.length,
                    (index) => MenuCardList(
                        press: () {
                          setState(() {
                            current == index;
                            selectedPayment = paymentMethod[index];
                            print(selectedPayment);
                          });
                        },
                        isForReq: true,
                        isSelected: selectedPayment == paymentMethod[index],
                        isPayment: true,
                        svg: imgUrls[index],
                        title: paymentMethod[index],
                        subtitle: payDesc[index])),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: 'Payment Information',
                  fontSize: 14,
                  textOverflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  textColor: Colors.black87,
                  weight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: "You are about to make a payment of GHS 300",
                  fontSize: 12,
                  textOverflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  textColor: Colors.black38,
                  weight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Divider(
                  thickness: 0.4,
                  color: Colors.grey.shade300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Fee Charged',
                    fontSize: 12,
                    textOverflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    textColor: Colors.black87,
                    weight: FontWeight.w400,
                  ),
                  AppText(
                    text: 'GHS 300',
                    fontSize: 14,
                    textOverflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    textColor: Colors.black87,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(
                height: 0.010.sh,
              ),
              selectedPayment == 'MTN Momo' ||
                      selectedPayment == 'Telecel Cash' ||
                      selectedPayment == 'AirtelTigo Money'
                  ? NumberTextField(
                      number: number,
                      contactController: contactController,
                      lable: 'Phone Number',
                      onInputChanged: (number) {
                        phoneNumber = number!.phoneNumber ?? '';
                      },
                    )
                  : selectedPayment == 'Visa Card'
                      ? Column(
                          children: [
                            CustomTextField(
                              controller: emailController,
                              hintext: 'Enter Card Holder Name',
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email!.isEmpty || !email.contains('@')) {
                                  return 'Please enter a valid email';
                                } else {
                                  return null;
                                }
                              },
                              lable: 'Card Holder Name',
                              isForm: true,
                            ),
                            SizedBox(
                              height: 0.015.sh,
                            ),
                            CustomTextField(
                              controller: emailController,
                              hintext: 'XXXX-XXXX-XXXX-XXXX',
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email!.isEmpty || !email.contains('@')) {
                                  return 'Please enter a valid email';
                                } else {
                                  return null;
                                }
                              },
                              lable: 'Card Number',
                              isForm: true,
                            ),
                            SizedBox(
                              height: 0.015.sh,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    controller: emailController,
                                    hintext: 'MM/YY',
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (email) {
                                      if (email!.isEmpty ||
                                          !email.contains('@')) {
                                        return 'Please enter a valid email';
                                      } else {
                                        return null;
                                      }
                                    },
                                    lable: 'Month/Year',
                                    isForm: true,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    controller: emailController,
                                    hintext: 'Enter CVV',
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (email) {
                                      if (email!.isEmpty ||
                                          !email.contains('@')) {
                                        return 'Please enter a valid email';
                                      } else {
                                        return null;
                                      }
                                    },
                                    lable: 'CVV',
                                    isForm: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
              SizedBox(
                height: 0.02.sh,
              ),
              CustomButton(
                  deviceWidth: double.infinity,
                  deviceHeight: 50,
                  rad: 15,
                  color: theme.secondaryColor ?? Colors.white,
                  press: () {
                    if (contactController.text.isNotEmpty) {
                      EasyLoading.show(status: 'Please wait...');
                      Timer(Duration(seconds: 3), () {
                        EasyLoading.dismiss();
                        Get.snackbar(
                            'Payment Success', "Payment made successfully",
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            icon: Icon(IconlyBold.shield_done));
                        showBottomSheet(context);
                      });
                    }
                  },
                  title: 'Make Payment'),
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(
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
              height: 0.3.sh,
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
                      text: 'Payment Success',
                      weight: FontWeight.w800,
                      fontSize: 18.sp,
                      textColor: Colors.black,
                    ),
                  ),
                  AppText(
                    text: "Do you want to proceed to register business name?",
                    weight: FontWeight.w400,
                    fontSize: 12.sp,
                    textAlign: TextAlign.left,
                    textOverflow: TextOverflow.visible,
                    textColor: Colors.black54,
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  CustomButton(
                      press: () {
                        switch (widget.title) {
                          case "Registration of Business Names":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NameRegistration()));
                            break;
                          case "Registration of Professional Bodies":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfessionalBodies()));
                            break;
                          default:
                            Navigator.pop(context);
                            break;
                        }
                      },
                      deviceWidth: double.infinity,
                      deviceHeight: 50,
                      rad: 10,
                      size: 14.sp,
                      color: theme.secondaryColor ?? Colors.white,
                      title: 'Proceed'),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  CustomButton(
                      press: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      },
                      deviceWidth: double.infinity,
                      deviceHeight: 50,
                      hasBorder: true,
                      rad: 10,
                      size: 14.sp,
                      color: Colors.white,
                      textColor: Colors.black87,
                      title: 'Continue Later '),
                ],
              )),
        );
      },
      isScrollControlled: true,
    );
  }

  void quitAlert(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    String text = lorem(paragraphs: 1, words: 200);

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Stack(children: <Widget>[
              StatefulBuilder(builder: (context, StateSetter setState) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  content: Container(
                      height: 0.2.sh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      width: _width,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppImages.orc,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText(
                                    text: "Quit Registration",
                                    fontSize: 15,
                                    weight: FontWeight.w600,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              height: 0.4.sh,
                              child: ListView(
                                children: [
                                  AppText(
                                    text:
                                        'Do you want to quit name registration payment?',
                                    fontSize: 12,
                                    textAlign: TextAlign.center,
                                    weight: FontWeight.w300,
                                    textOverflow: TextOverflow.visible,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 0.015.sh,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          deviceWidth: 120,
                                          deviceHeight: 38,
                                          hasBorder: true,
                                          textColor: Colors.white,
                                          color: Colors.red,
                                          title: 'Cancel',
                                          size: 12,
                                          rad: 5,
                                          press: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          deviceWidth: 120,
                                          deviceHeight: 38,
                                          textColor: Colors.white,
                                          color: theme.secondaryColor ??
                                              Colors.white,
                                          title: 'Proceed',
                                          size: 12,
                                          rad: 5,
                                          press: () {
                                            Get.off(() => Dashboard(),
                                                transition:
                                                    Transition.leftToRight,
                                                duration: const Duration(
                                                    milliseconds: 200));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              }),
            ]));
  }
}

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
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/authWedget.dart';
import '../../../../../utils/widgets/customButton.dart';
import '../../../../../utils/widgets/custom_appBar.dart';
import '../../../../../utils/widgets/numberTextField.dart';

class Entity_Payment extends StatefulWidget {
  const Entity_Payment({super.key});

  @override
  State<Entity_Payment> createState() => _Entity_PaymentState();
}

class _Entity_PaymentState extends State<Entity_Payment> {
  int current = 0;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String selectedPayment = '';
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  String phoneNumber = '';
  final List<String> paymentMethod = [
    'MTN Momo',
    'Telecel Cash',
    'Credit Card',
  ];

  List<String> payDesc = [
    "Use MTN momo to process paymnet",
    "Use Telecel Cash to process payment",
    "Use your Credit Card to process payment",
  ];

  List<String> imgUrls = [
    AppImages.mtn,
    AppImages.telecel,
    AppImages.visa,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Entity Request - Payment',
            hasBackbtn: true,
            hasAction: true,
            backBtn: () {
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
                children: List.generate(
                    paymentMethod.length,
                    (index) => MenuCardList(
                        press: () {
                          setState(() {
                            current == index;
                            selectedPayment = paymentMethod[index];
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
                  text: "You are about to make a payment of GHS 500",
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
                    text: 'GHS 100',
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
              selectedPayment == 'MTN Momo' || selectedPayment == 'Telecel Cash'
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
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
}

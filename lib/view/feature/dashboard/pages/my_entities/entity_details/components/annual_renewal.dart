import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/custom_textfield.dart';
import 'package:orc_public/utils/widgets/numberTextField.dart';
import 'package:provider/provider.dart';

import '../../../../../../../controller/theme_provider.dart';
import '../../../../../../../utils/constants/app_images.dart';
import '../../../../../../../utils/widgets/app_text.dart';
import '../../../../../../../utils/widgets/customButton.dart';
import '../../../../../../../utils/widgets/menuCardList.dart';

class AnnualRenewal extends StatefulWidget {
  const AnnualRenewal({super.key});

  @override
  State<AnnualRenewal> createState() => _AnnualRenewalState();
}

class _AnnualRenewalState extends State<AnnualRenewal> {
  int current = 0;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String selectedPayment = '';
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  String phoneNumber = '';
  bool isRenew = false;

  final List<String> paymentMethod = [
    'MTN Momo',
    'Telecel Cash',
    'Visa Card',
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
    return Column(
      children: [
        isRenew
            ? SizedBox.shrink()
            : RenewalCard(
                press: () {
                  setState(() {
                    isRenew = true;
                  });
                },
              ),
        isRenew
            ? SizedBox(
                height: 0.5.sh,
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
                              isSelected:
                                  selectedPayment == paymentMethod[index],
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
                        text: "You are about to make a payment of GHS 60",
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
                          text: 'GHS 60',
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
                            selectedPayment == 'Telecel Cash'
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
                                      if (email!.isEmpty ||
                                          !email.contains('@')) {
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
                                      if (email!.isEmpty ||
                                          !email.contains('@')) {
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
                                          keyboardType:
                                              TextInputType.emailAddress,
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
                                          keyboardType:
                                              TextInputType.emailAddress,
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
                              Get.snackbar('Payment Success',
                                  "Payment made successfully, Business name renewed",
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  icon: Icon(IconlyBold.shield_done));
                            });
                          }
                        },
                        title: 'Make Payment'),
                    SizedBox(
                      height: 0.015.sh,
                    ),
                    CustomButton(
                        deviceWidth: double.infinity,
                        deviceHeight: 50,
                        rad: 15,
                        hasBorder: true,
                        color: Colors.white,
                        textColor: Colors.red,
                        press: () {
                          setState(() {
                            isRenew = false;
                          });
                        },
                        title: 'Cancel'),
                  ],
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

class RenewalCard extends StatelessWidget {
  VoidCallback? press;
  RenewalCard({
    super.key,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.17.sh,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 10),
          ],
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 0.17.sh,
              padding: EdgeInsets.only(left: 15, top: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Renew your business",
                    textColor: Colors.black87,
                    fontSize: 10.sp,
                    weight: FontWeight.w400,
                  ),
                  AppText(
                    text: "Name Registration",
                    textColor: Colors.black87,
                    textAlign: TextAlign.left,
                    fontSize: 14.sp,
                    weight: FontWeight.w600,
                  ),
                  AppText(
                    text: "Make sure your business \ninfo is up to data",
                    textColor: Colors.black87,
                    textAlign: TextAlign.left,
                    fontSize: 12.sp,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 0.008.sh,
                  ),
                  CustomButton(
                    deviceWidth: 160,
                    deviceHeight: 38,
                    press: press,
                    title: 'Renew Business',
                    size: 15,
                    textColor: Colors.white,
                    rad: 5,
                    color: secondaryColor,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ClipPath(
              clipper: OvalLeftBorderClipper(),
              child: Container(
                height: 0.17.sh,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bgImg.jpg')),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(3),
                      bottomRight: Radius.circular(3)),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

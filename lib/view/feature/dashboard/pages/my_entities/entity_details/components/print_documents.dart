import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/customButton.dart';
import 'package:provider/provider.dart';

import '../../../../../../../controller/theme_provider.dart';
import '../../../../../../../utils/constants/app_images.dart';
import '../../../../../../../utils/widgets/app_text.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../../../utils/widgets/custom_textfield.dart';
import '../../../../../../../utils/widgets/menuCardList.dart';
import '../../../../../../../utils/widgets/numberTextField.dart';

class PrintDocuments extends StatefulWidget {
  const PrintDocuments({super.key});

  @override
  State<PrintDocuments> createState() => _PrintDocumentsState();
}

class _PrintDocumentsState extends State<PrintDocuments> {
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
    return !isRenew
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 10),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.06),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: ListTile(
                    leading: Icon(
                      IconlyBold.info_circle,
                      color: secondaryColor,
                    ),
                    title: AppText(
                      textAlign: TextAlign.left,
                      text:
                          'Please choose the document and the exact version of it in the transaction selection.',
                      textColor: Colors.black,
                      fontSize: 11.sp,
                      textOverflow: TextOverflow.visible,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Document Type',
                        textAlign: TextAlign.center,
                        fontSize: 13,
                        textOverflow: TextOverflow.visible,
                        weight: FontWeight.w400,
                        textColor: const Color.fromARGB(221, 162, 78, 78),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomDropdown.search(
                        overlayHeight: 0.4.sh,
                        excludeSelected: false,
                        decoration: CustomDropdownDecoration(
                            expandedFillColor:
                                Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.grey.shade200,
                            closedFillColor:
                                Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.grey.shade200,
                            expandedBorderRadius: BorderRadius.circular(10),
                            closedSuffixIcon: Icon(Icons.arrow_drop_down),
                            listItemStyle: TextStyle(
                                color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Colors.grey
                                    : Colors.black54,
                                fontSize: 14),
                            headerStyle: TextStyle(
                                color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Colors.grey
                                    : Colors.black54,
                                fontSize: 14),
                            hintStyle: TextStyle(
                                color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Colors.grey
                                    : Colors.black54,
                                fontSize: 14),
                            closedBorderRadius: BorderRadius.circular(10)),
                        hintText: 'Select Category',
                        items: printDocs,
                        initialItem: selectedDoc,
                        onChanged: (value) {
                          setState(() {
                            selectedDoc = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 0.015.sh,
                      ),
                      AppText(
                        text: 'Transaction',
                        textAlign: TextAlign.center,
                        fontSize: 13,
                        textOverflow: TextOverflow.visible,
                        weight: FontWeight.w400,
                        textColor: Colors.black87,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomDropdown.search(
                        overlayHeight: 0.4.sh,
                        excludeSelected: false,
                        decoration: CustomDropdownDecoration(
                            expandedFillColor:
                                Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.grey.shade200,
                            closedFillColor:
                                Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.grey.shade200,
                            expandedBorderRadius: BorderRadius.circular(10),
                            closedSuffixIcon: Icon(Icons.arrow_drop_down),
                            listItemStyle: TextStyle(
                                color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Colors.grey
                                    : Colors.black54,
                                fontSize: 14),
                            headerStyle: TextStyle(
                                color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Colors.grey
                                    : Colors.black54,
                                fontSize: 14),
                            hintStyle: TextStyle(
                                color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                    ? Colors.grey
                                    : Colors.black54,
                                fontSize: 14),
                            closedBorderRadius: BorderRadius.circular(10)),
                        hintText: 'Select Category',
                        items: printTrans,
                        initialItem: selectedTrans,
                        onChanged: (value) {
                          setState(() {
                            selectedTrans = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(
                    deviceWidth: double.maxFinite,
                    deviceHeight: 38,
                    size: 13.sp,
                    rad: 4,
                    title: "Print Document",
                    press: () {
                      setState(() {
                        isRenew = true;
                      });
                    },
                    color: secondaryColor,
                  ),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
              ],
            ),
          )
        : SizedBox(
            height: 0.5.sh,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.06),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: ListTile(
                    leading: Icon(
                      IconlyBold.info_circle,
                      color: secondaryColor,
                    ),
                    title: AppText(
                      textAlign: TextAlign.left,
                      text:
                          'Please make payment to proceed with printing document.',
                      textColor: Colors.black,
                      fontSize: 11.sp,
                      textOverflow: TextOverflow.visible,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
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
                          Get.snackbar('Payment Success',
                              "Payment made successfully, You can proceed to print document",
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              icon: Icon(IconlyBold.shield_done));
                          Share.share(
                              'Proceed to print or share ${selectedDoc}');
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
                    SizedBox(height: 0.2.sh,)
              ],
            ),
          );
  }
}

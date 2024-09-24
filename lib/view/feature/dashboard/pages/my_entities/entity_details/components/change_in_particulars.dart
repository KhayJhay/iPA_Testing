import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/change_form.dart';

import '../../../../../../../utils/constants/app_images.dart';
import '../../../../../../../utils/widgets/app_text.dart';
import '../../../../../../../utils/widgets/customButton.dart';
import '../../../../../../../utils/widgets/custom_checkbox.dart';
import '../../../../../../../utils/widgets/custom_textfield.dart';
import '../../../../../../../utils/widgets/detail_expanded_widget.dart';
import '../../../../../../../utils/widgets/detail_tile_widget.dart';
import '../../../../../../../utils/widgets/menuCardList.dart';
import '../../../../../../../utils/widgets/numberTextField.dart';

class ChangeInParticulars extends StatefulWidget {
  const ChangeInParticulars({
    super.key,
  });

  @override
  State<ChangeInParticulars> createState() => _ChangeInParticularsState();
}

class _ChangeInParticularsState extends State<ChangeInParticulars> {
  List<String> _selectedBusinessDetails = [];
  List<String> _selectedAddressDetails = [];
  List<String> _selectedContactDetails = [];
  List<String> _selectedpropDetail = [];
  bool makePayment = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  String selectedPayment = '';
  String initialCountry = 'GH';
  PhoneNumber number = PhoneNumber(isoCode: 'GH');
  String phoneNumber = '';
  bool isRenew = false;
  int current = 0;
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
    return SizedBox(
      height: 0.6.sh,
      child: SingleChildScrollView(
        child: !makePayment
            ? Column(
                children: [
                  Detail_Expanded_Widget(
                    title: 'Change Business Details',
                    subtitle: '- Business name,sector,nature of business etc',
                    element: Column(
                      children: [
                        CustomCheckboxListTile(
                          title: 'Business Name',
                          subtitle: 'Example Company LTD',
                          selectedItems: _selectedBusinessDetails,
                          itemValue: 'Business Name',
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                _selectedBusinessDetails.add('Business Name');
                              } else {
                                _selectedBusinessDetails
                                    .remove('Business Name');
                              }
                            });
                          },
                        ),
                        CustomCheckboxListTile(
                          title: 'Business Details',
                          subtitle: 'GHA-0239032-32, Osu Street',
                          selectedItems: _selectedBusinessDetails,
                          itemValue: 'Business Detail',
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                _selectedBusinessDetails.add('Business Detail');
                              } else {
                                _selectedBusinessDetails
                                    .remove('Business Detail');
                              }
                            });
                          },
                        ),
                        _selectedBusinessDetails.isEmpty
                            ? SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          secondaryColor.withOpacity(0.3),
                                      radius: 12,
                                      child: AppText(
                                        textAlign: TextAlign.left,
                                        text:
                                            '${_selectedBusinessDetails.length}',
                                        weight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          textAlign: TextAlign.left,
                                          text: _selectedBusinessDetails
                                              .join(', '),
                                          weight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          textColor: Colors.black,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              makePayment = true;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                IconlyLight.edit_square,
                                                color: secondaryColor,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              AppText(
                                                textAlign: TextAlign.right,
                                                text: 'Change',
                                                weight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                textColor: secondaryColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  Detail_Expanded_Widget(
                    title: 'Change Address Details',
                    subtitle: '- Principal,registered office address etc',
                    element: Column(
                      children: [
                        CustomCheckboxListTile(
                          title: 'Address Detail',
                          subtitle: 'Example Company LTD',
                          selectedItems: _selectedAddressDetails,
                          itemValue: 'Address Detail',
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                _selectedAddressDetails.add('Address Detail');
                              } else {
                                _selectedAddressDetails
                                    .remove('Address Detail');
                              }
                            });
                          },
                        ),
                        _selectedAddressDetails.isEmpty
                            ? SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          secondaryColor.withOpacity(0.3),
                                      radius: 12,
                                      child: AppText(
                                        textAlign: TextAlign.left,
                                        text:
                                            '${_selectedAddressDetails.length}',
                                        weight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          textAlign: TextAlign.left,
                                          text: _selectedAddressDetails
                                              .join(', '),
                                          weight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          textColor: Colors.black,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              makePayment = true;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                IconlyLight.edit_square,
                                                color: secondaryColor,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              AppText(
                                                textAlign: TextAlign.right,
                                                text: 'Change',
                                                weight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                textColor: secondaryColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  Detail_Expanded_Widget(
                    title: 'Change Contact Details',
                    subtitle: '- Mobile,phone number,email address etc',
                    element: Column(
                      children: [
                        CustomCheckboxListTile(
                          title: 'Contact Detail',
                          subtitle: 'www.orcgh.com',
                          selectedItems: _selectedContactDetails,
                          itemValue: 'Contact Detail',
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                _selectedContactDetails.add('Contact Detail');
                              } else {
                                _selectedContactDetails
                                    .remove('Contact Detail');
                              }
                            });
                          },
                        ),
                        _selectedContactDetails.isEmpty
                            ? SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          secondaryColor.withOpacity(0.3),
                                      radius: 12,
                                      child: AppText(
                                        textAlign: TextAlign.left,
                                        text:
                                            '${_selectedContactDetails.length}',
                                        weight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          textAlign: TextAlign.left,
                                          text: _selectedContactDetails
                                              .join(', '),
                                          weight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          textColor: Colors.black,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              makePayment = true;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                IconlyLight.edit_square,
                                                color: secondaryColor,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              AppText(
                                                textAlign: TextAlign.right,
                                                text: 'Change',
                                                weight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                textColor: secondaryColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  Detail_Expanded_Widget(
                    title: 'Change Officer Details',
                    subtitle: '- Proprietor/Proprietress data',
                    element: Column(
                      children: [
                        CustomCheckboxListTile(
                          title: 'Proprietor/Proprietor Address',
                          subtitle: 'GHA-2839823-89..\nOsu Street,Accra...',
                          selectedItems: _selectedpropDetail,
                          itemValue: 'Address Detail',
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                _selectedpropDetail.add('Address Detail');
                              } else {
                                _selectedpropDetail.remove('Address Detail');
                              }
                            });
                          },
                        ),
                        CustomCheckboxListTile(
                          title: 'Proprietor/Proprietor Details',
                          subtitle: 'Mr. Dogbey Sef Boateng\nGHA-0932323-23',
                          selectedItems: _selectedpropDetail,
                          itemValue: 'Prop Detail',
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                _selectedpropDetail.add('Prop Detail');
                              } else {
                                _selectedpropDetail.remove('Prop Detail');
                              }
                            });
                          },
                        ),
                        _selectedpropDetail.isEmpty
                            ? SizedBox.shrink()
                            : Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          secondaryColor.withOpacity(0.3),
                                      radius: 12,
                                      child: AppText(
                                        textAlign: TextAlign.left,
                                        text: '${_selectedpropDetail.length}',
                                        weight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        textColor: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          textAlign: TextAlign.left,
                                          text: _selectedpropDetail.join(', '),
                                          weight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          textColor: Colors.black,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              makePayment = true;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                IconlyLight.edit_square,
                                                color: secondaryColor,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              AppText(
                                                textAlign: TextAlign.right,
                                                text: 'Change',
                                                weight: FontWeight.w500,
                                                fontSize: 15.sp,
                                                textColor: secondaryColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  )
                ],
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
                              'Please make payment to proceed with changing document.',
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
                                  "Payment made successfully, You can proceed to print document",
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  icon: Icon(IconlyBold.shield_done));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangeInPartForm(
                                          selectedChanges: _selectedBusinessDetails
                                                  .isNotEmpty
                                              ? _selectedBusinessDetails
                                              : _selectedAddressDetails
                                                      .isNotEmpty
                                                  ? _selectedAddressDetails
                                                  : _selectedContactDetails
                                                          .isNotEmpty
                                                      ? _selectedContactDetails
                                                      : _selectedpropDetail
                                                              .isNotEmpty
                                                          ? _selectedpropDetail
                                                          : [],
                                          title: _selectedBusinessDetails
                                                  .isNotEmpty
                                              ? 'Change Business Details'
                                              : _selectedAddressDetails
                                                      .isNotEmpty
                                                  ? 'Change Address Details'
                                                  : _selectedContactDetails
                                                          .isNotEmpty
                                                      ? 'Change Contact Details'
                                                      : _selectedpropDetail
                                                              .isNotEmpty
                                                          ? 'Change Officer Details'
                                                          : '')));
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
                            makePayment = false;
                          });
                        },
                        title: 'Cancel'),
                    SizedBox(
                      height: 0.2.sh,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/dopdownWidget.dart';
import 'package:orc_public/utils/widgets/multiSelect_dropdown.dart';
import 'package:orc_public/utils/widgets/multi_choice_chiips.dart';
import 'package:orc_public/utils/widgets/nameCard.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_reservation/reservation_payment.dart';

import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/authWedget.dart';
import '../../../../../utils/widgets/customButton.dart';
import '../../../../../utils/widgets/custom_appBar.dart';

class NameReservationForm extends StatefulWidget {
  final String name;
  const NameReservationForm({super.key, required this.name});

  @override
  State<NameReservationForm> createState() => _NameReservationFormState();
}

class _NameReservationFormState extends State<NameReservationForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController tinController = TextEditingController();
  String selectedEntityType = 'Sole Proprietorship';
  List<String> entityType = [
    'Sole Proprietorship',
    'Private Partnership',
  ];
  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Name Reservation',
            hasBackbtn: true,
            backBtn: () {
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Business Name Details',
                  fontSize: 18,
                  textColor: Colors.black87,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 0.008.sh,
                ),
                AppText(
                  text:
                      'Fill in all details regarding the business name you want to reserve',
                  fontSize: 12,
                  textColor: Colors.black87,
                  weight: FontWeight.w300,
                  textAlign: TextAlign.left,
                  textOverflow: TextOverflow.visible,
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                CustomTextField(
                  controller: nameController,
                  hintext: 'eg.ABC Ventures',
                  keyboardType: TextInputType.emailAddress,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please enter a valid name';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Business Name',
                  isForm: true,
                ),
                CustomTextField(
                  controller: tinController,
                  hintext: 'eg.P10293844483',
                  keyboardType: TextInputType.emailAddress,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please enter a valid TIN NUMBER';
                    } else {
                      return null;
                    }
                  },
                  lable: 'TIN Number',
                  isForm: true,
                ),
                SizedBox(
                  height: 0.008.sh,
                ),
                dropDownWidget(
                    insurance: entityType,
                    selectedValue: selectedEntityType,
                    label: 'Entity type',
                    hint: 'Select entity type'),
                MultiSelectDrop(),
                SizedBox(
                  height: 0.015.sh,
                ),
                MultiSelectChips(),
                SizedBox(
                  height: 0.05.sh,
                ),
                CustomButton(
                    deviceWidth: double.infinity,
                    deviceHeight: 50,
                    rad: 15,
                    color: theme.secondaryColor ?? Colors.white,
                    press: () {
                      if (tinController.text.isNotEmpty) {
                        EasyLoading.show(status: 'Please wait...');
                        Timer(Duration(seconds: 3), () {
                          EasyLoading.dismiss();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Reservation_Payment()));
                        });
                      }
                    },
                    title: 'Proceed'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

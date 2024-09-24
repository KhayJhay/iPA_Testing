import 'dart:async';

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/business_address.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/personal_details_form.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/proprietess_address.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../../../../../controller/name_reg_provider.dart';
import '../../../../../../../utils/widgets/app_text.dart';
import '../../../../../../../utils/widgets/customButton.dart';
import '../../../../../../../utils/widgets/custom_appBar.dart';
import '../../../../../../../utils/widgets/custom_textfield.dart';
import '../../../../../../../utils/widgets/multiSelect_dropdown.dart';
import '../../../name_registration/components/contact_details_form.dart';

class ChangeInPartForm extends StatefulWidget {
  final List<String> selectedChanges;
  final String title;
  const ChangeInPartForm(
      {super.key, required this.selectedChanges, required this.title});

  @override
  State<ChangeInPartForm> createState() => _ChangeInPartFormState();
}

class _ChangeInPartFormState extends State<ChangeInPartForm> {
  @override
  DateTime? selectedDate;
  @override
  void initState() {
    // TODO: implement initState
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);

    super.initState();
    nameRegNotifier.fetchSectors();
  }

  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);

    void datePicker() async {
      final date = await showDatePickerDialog(
        context: context,
        initialDate: DateTime.now(),
        maxDate: DateTime.now().add(const Duration(days: 365 * 3)),
        minDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
      );
      if (date != null) {
        setState(() {
          selectedDate = date;
          nameRegNotifier.dateController.text =
              DateFormat('dd/MM/yyyy').format(selectedDate!);
        });
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 60.0),
        child: CustomButton(
            deviceWidth: double.infinity,
            deviceHeight: 50,
            rad: 15,
            hasBorder: true,
            color: Colors.white,
            textColor: Colors.red,
            press: () {
              if (nameRegNotifier.businessNameController.text.isNotEmpty) {
                EasyLoading.show(status: 'Please wait...');
                Timer(Duration(seconds: 3), () {
                  EasyLoading.dismiss();
                  Get.snackbar('Changes Applied',
                      "Changes has been successfully applied",
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      icon: Icon(IconlyBold.shield_done));
                });
              }
            },
            title: 'Apply Changes'),
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Custom_AppBar(
            title: widget.title,
            hasBackbtn: true,
            backBtn: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(
                            selectedIndex: 1,
                          )));
              ;
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
          child: Column(
            children: [
              if (widget.title == 'Change Business Details')
                Column(
                  children: [
                    widget.selectedChanges.contains('Business Detail')
                        ? SizedBox.shrink()
                        : CustomTextField(
                            controller: nameRegNotifier.businessNameController,
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
                    widget.selectedChanges.contains('Business Name')
                        ? SizedBox()
                        : Column(
                            children: [
                              MultiSelectDrop(),
                              SizedBox(
                                height: 0.015.sh,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Date of Commencement',
                                    textAlign: TextAlign.center,
                                    fontSize: 13,
                                    textOverflow: TextOverflow.visible,
                                    weight: FontWeight.w400,
                                    textColor: Colors.black87,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  InkWell(
                                    onTap: () => datePicker(),
                                    child: Container(
                                      height: 55,
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            text: selectedDate == null
                                                ? 'Select date of commencement'
                                                : '${DateFormat('dd/MM/yyyy').format(selectedDate!)}',
                                            textColor: selectedDate == null
                                                ? Colors.grey.shade400
                                                : Colors.black,
                                            fontSize: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          Icon(
                                            IconlyLight.calendar,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    widget.selectedChanges.contains('Business Name') &&
                            widget.selectedChanges.contains('Business Detail')
                        ? Column(
                            children: [
                              CustomTextField(
                                controller:
                                    nameRegNotifier.businessNameController,
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
                              SizedBox(
                                height: 0.015.sh,
                              ),
                              MultiSelectDrop(),
                              SizedBox(
                                height: 0.015.sh,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Date of Commencement',
                                    textAlign: TextAlign.center,
                                    fontSize: 13,
                                    textOverflow: TextOverflow.visible,
                                    weight: FontWeight.w400,
                                    textColor: Colors.black87,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  InkWell(
                                    onTap: () => datePicker(),
                                    child: Container(
                                      height: 55,
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            text: selectedDate == null
                                                ? 'Select date of commencement'
                                                : '${DateFormat('dd/MM/yyyy').format(selectedDate!)}',
                                            textColor: selectedDate == null
                                                ? Colors.grey.shade400
                                                : Colors.black,
                                            fontSize: 14,
                                            weight: FontWeight.w400,
                                          ),
                                          Icon(
                                            IconlyLight.calendar,
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              if (widget.title == 'Change Address Details')
                BusinessAddressForm(),
              if (widget.title == 'Change Contact Details')
                ContactDetailsForm(),
              if (widget.title == 'Change Officer Details')
                Column(
                  children: [
                    widget.selectedChanges.contains('Address Detail')
                        ? ProprietorsAddress()
                        : SizedBox.shrink(),
                    PersonalDetailsForm(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

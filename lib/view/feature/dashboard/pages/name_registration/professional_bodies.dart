import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/controller/name_reg_provider.dart';
import 'package:orc_public/models/business_creation_model.dart';
import 'package:orc_public/services/helpers/business_creation_helper.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/customButton.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/business_address.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/business_details.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/contact_details_form.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/personal_details_form.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/professional_details.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/widgets/custom_appBar.dart';

class ProfessionalBodies extends StatefulWidget {
  const ProfessionalBodies({super.key});

  @override
  State<ProfessionalBodies> createState() => _ProfessionalBodiesState();
}

class _ProfessionalBodiesState extends State<ProfessionalBodies> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NameRegProvider>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              floatingActionButton: model.currentPage == 3
                  ? InkWell(
                      onTap: () {
                        EasyLoading.show(status: 'Please wait...');
                        Timer(Duration(seconds: 4), () {
                          EasyLoading.dismiss();
                          Get.snackbar('Application Completed',
                              "Business application created successfully",
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                              icon: Icon(IconlyBold.shield_done));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        });
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? theme.secondaryColor
                                    : Theme.of(context).colorScheme.secondary),
                        child: Center(
                            child: AppText(
                          text: 'Complete Registration',
                          fontSize: 15,
                          weight: FontWeight.w400,
                        )),
                      ),
                    )
                  : model.currentPage >= 1
                      ? Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: CustomButton(
                                press: () {
                                  _pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                                deviceWidth: 200,
                                deviceHeight: 50,
                                title: 'Previous',
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.white,
                                hasBorder: true,
                                textColor: Colors.black87,
                              )),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: CustomButton(
                                press: () {
                                  if (model.currentPage == 1) {
                                    _pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut);
                                  }
                                  if (model.currentPage == 2) {
                                    if (model.thirdFormKey.currentState!
                                        .validate()) {
                                      EasyLoading.show(
                                          status: 'Saving Contact Detail...');
                                      Timer(Duration(seconds: 3), () {
                                        EasyLoading.dismiss();
                                        Get.snackbar('Contact Added',
                                            "Contact added successfully",
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                            icon: Icon(IconlyBold.shield_done));
                                        _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      });
                                    }
                                  }
                                },
                                deviceWidth: 200,
                                deviceHeight: 50,
                                title: 'Next',
                                hasBorder: false,
                                color: theme.secondaryColor ?? Colors.white,
                              )),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (model.validateAndSave()) {
                              EasyLoading.show(
                                status: 'Saving...',
                              );
                              // BusinessCreationModel businessCreationModel =
                              //     BusinessCreationModel(
                              //   name: model.businessNameController.text,
                              //   sector: model.selectedOptions,
                              //   natureOfBusiness: model.selectedOptions[0],
                              //   businessType: 'Sole Prop',
                              //   isicCode: model.selectedIsics,
                              //   tin: model.businessTINController.text,
                              //   principalBusinessActivity:
                              //       model.selectedOptions[0],
                              // );

                              // print(jsonEncode(businessCreationModel));
                              // BusinessCreationHelper.businessCreation(
                              //         businessCreationModel)
                              //     .then((response) {
                              //   if (response == 'success') {
                              //     Get.snackbar('Business Created',
                              //         "Businness Created successfully",
                              //         backgroundColor: Colors.green,
                              //         colorText: Colors.white,
                              //         icon: Icon(IconlyBold.shield_done));
                              //     EasyLoading.dismiss();
                              // _pageController.nextPage(
                              //     duration: Duration(milliseconds: 300),
                              //     curve: Curves.easeInOut);
                              //   } else {
                              //     Get.snackbar('Failed', "$response",
                              //         backgroundColor: Colors.red,
                              //         colorText: Colors.white,
                              //         icon: Icon(IconlyBold.danger));
                              //     EasyLoading.dismiss();
                              //   }
                              // });
                              Timer(Duration(seconds: 4), () {
                                EasyLoading.dismiss();
                                Get.snackbar('Business Created',
                                    "Businness Created successfully",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    icon: Icon(IconlyBold.shield_done));

                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut);
                              });
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.tertiary),
                            child: Center(
                              child: Icon(
                                IconlyBold.arrow_right_3,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(120),
                  child: Custom_AppBar(
                    title: 'Professional Bodies',
                    hasBackbtn: true,
                    backBtn: () {
                      setState(() {
                        model.currentPage == 0;
                      });
                      Navigator.pop(context);
                    },
                  )),
              body: SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: model.currentPageTitle,
                          fontSize: 15,
                          textColor: Colors.black87,
                          weight: FontWeight.w600,
                        ),
                        Container(
                          height: 0.038.sh,
                          width: 80,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? theme.secondaryColor
                                    : Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: AppText(
                              text: '0${model.currentPage + 1}/04',
                              textColor: Colors.white,
                              weight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 0.02.sh),
                    LinearProgressIndicator(
                      value: (model.currentPage + 1) / 4, // Assuming 12 pages
                      backgroundColor: Colors.grey[200],
                      color: Theme.of(context).colorScheme.tertiary,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(height: 0.02.sh),
                    Expanded(
                      child: PageView(
                        padEnds: true,
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        onPageChanged: (index) {
                          model.setPage(index);
                        },
                        children: [
                          ProfessionalDetailsForm(),
                          BusinessAddressForm(),
                          ContactDetailsForm(),
                          PersonalDetailsForm()
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ));
  }
}

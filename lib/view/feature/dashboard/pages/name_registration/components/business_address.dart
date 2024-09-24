import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/models/address_model.dart';
import 'package:orc_public/services/helpers/business_creation_helper.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/multi_choice_chiips.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/addressComponent.dart';
import 'package:provider/provider.dart';

import '../../../../../../controller/name_reg_provider.dart';
import '../../../../../../utils/widgets/authWedget.dart';

class BusinessAddressForm extends StatefulWidget {
  const BusinessAddressForm({super.key});

  @override
  State<BusinessAddressForm> createState() => _BusinessAddressFormState();
}

class _BusinessAddressFormState extends State<BusinessAddressForm> {
  final TextEditingController emailController = TextEditingController();
  int selectedValue = 0;
  int selectedValuePart = 0;
  int selectedValuePrince = 0;
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<String> countryList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  void populateAddress() {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    if (nameRegNotifier.officeDigitalAddressController.text.isNotEmpty) {
      setState(() {
        nameRegNotifier.officeHouseNoController.text = 'Flat 12';
        nameRegNotifier.officeStreetNameController.text = 'Saxel Street';
        nameRegNotifier.officeCityController.text = 'Accra';
      });
    }
  }

  void populatePlaceAddress() {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    if (nameRegNotifier.businessDigitalAddressController.text.isNotEmpty) {
      setState(() {
        nameRegNotifier.businessHouseNoController.text = 'Ab 243';
        nameRegNotifier.businessStreetNameController.text = 'Ring Road';
        nameRegNotifier.businessCityController.text = 'Accra';
      });
    }
  }

  void populateOtherPlaceAddress() {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    if (nameRegNotifier.otherDigitalAddressController.text.isNotEmpty) {
      setState(() {
        nameRegNotifier.otherHouseNoController.text = 'AG 243';
        nameRegNotifier.otherStreetNameController.text = 'Ablekuma ST';
        nameRegNotifier.otherCityController.text = 'Accra';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Business Address',
              fontSize: 18,
              textColor: Colors.black87,
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 0.008.sh,
            ),
            AppText(
              text: 'Fill in all details regarding your business addresses',
              fontSize: 12,
              textColor: Colors.black87,
              weight: FontWeight.w300,
              textAlign: TextAlign.left,
              textOverflow: TextOverflow.visible,
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            FadeInUp(
              child: AddressForm(
                title: 'Registered Office Address',
                digitalAddress: nameRegNotifier.officeDigitalAddressController,
                houseNo: nameRegNotifier.officeHouseNoController,
                streetName: nameRegNotifier.officeStreetNameController,
                city: nameRegNotifier.officeCityController,
                country: nameRegNotifier.countryController,
                press: () {
                  EasyLoading.show(status: 'Saving address...');
                  // AddressModel model = AddressModel(
                  //   city: nameRegNotifier.officeCityController.text,
                  //   digitalAddress:
                  //       nameRegNotifier.officeDigitalAddressController.text,
                  //   houseNumber: nameRegNotifier.officeHouseNoController.text,
                  //   streetName: nameRegNotifier.officeStreetNameController.text,
                  //   district: 'Accra North',
                  //   country: 'Ghana',
                  // );
                  // BusinessCreationHelper.patchOfficeAddress(
                  //         model, false, false, true)
                  //     .then((response) {
                  //   if (response == 'success') {
                  //     Get.snackbar('Address Added', "Businness address added",
                  //         backgroundColor: Colors.green,
                  //         colorText: Colors.white,
                  //         icon: Icon(IconlyBold.shield_done));
                  //     EasyLoading.dismiss();
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
                    Get.snackbar('Address Added', "Businness address added",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                        icon: Icon(IconlyBold.shield_done));
                  });
                },
                verify: () => populateAddress(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Owner of premises',
                  fontSize: 14,
                  textColor: const Color.fromARGB(221, 1, 1, 1),
                  weight: FontWeight.w600,
                ),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: selectedValue,
                      onChanged: (value) =>
                          setState(() => selectedValue = value!),
                    ),
                    const Text('Rented'),
                    Radio(
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (value) =>
                          setState(() => selectedValue = value!),
                    ),
                    const Text('Owner Occupied'),
                    Radio(
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (value) =>
                          setState(() => selectedValue = value!),
                    ),
                    const Text('Free Use'),
                  ],
                ),
              ],
            ),
            selectedValue == 1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Is it part rented? (Premises is Owner Occupied)',
                        fontSize: 14,
                        textColor: const Color.fromARGB(221, 1, 1, 1),
                        weight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: selectedValuePart,
                            onChanged: (value) =>
                                setState(() => selectedValuePart = value!),
                          ),
                          const Text('Yes'),
                          Radio(
                            value: 1,
                            groupValue: selectedValuePart,
                            onChanged: (value) =>
                                setState(() => selectedValuePart = value!),
                          ),
                          const Text('No'),
                        ],
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            selectedValuePart == 0
                ? CustomTextField(
                    controller: nameRegNotifier.landLordNameController,
                    hintext: "Please provide landlord's name",
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Please this field is empty';
                      } else {
                        return null;
                      }
                    },
                    lable: "Landlord's name",
                    isForm: true,
                  )
                : SizedBox.shrink(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text:
                      'Is the Principal place of Business the same as the Registered Office Address? (If no provide details below)',
                  fontSize: 14,
                  textAlign: TextAlign.left,
                  textColor: const Color.fromARGB(221, 1, 1, 1),
                  weight: FontWeight.w600,
                ),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: selectedValuePrince,
                      onChanged: (value) =>
                          setState(() => selectedValuePrince = value!),
                    ),
                    const Text('Yes'),
                    Radio(
                      value: 1,
                      groupValue: selectedValuePrince,
                      onChanged: (value) =>
                          setState(() => selectedValuePrince = value!),
                    ),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            selectedValuePrince == 1
                ? FadeInUp(
                    child: AddressForm(
                        verify: () => populatePlaceAddress(),
                        title: 'Principal Place of Business',
                        digitalAddress:
                            nameRegNotifier.businessDigitalAddressController,
                        houseNo: nameRegNotifier.businessHouseNoController,
                        streetName:
                            nameRegNotifier.businessStreetNameController,
                        city: nameRegNotifier.businessCityController),
                  )
                : SizedBox.shrink(),
            FadeInUp(
              child: AddressForm(
                  title: 'Other Places of Business',
                  verify: () => populateOtherPlaceAddress(),
                  digitalAddress: nameRegNotifier.otherDigitalAddressController,
                  houseNo: nameRegNotifier.otherHouseNoController,
                  streetName: nameRegNotifier.otherStreetNameController,
                  city: nameRegNotifier.otherCityController),
            ),
            SizedBox(
              height: 0.20.sh,
            ),
          ],
        ),
      ),
    );
  }
}

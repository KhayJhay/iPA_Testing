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

class ProprietorsAddress extends StatefulWidget {
  const ProprietorsAddress({super.key});

  @override
  State<ProprietorsAddress> createState() => _ProprietorsAddressState();
}

class _ProprietorsAddressState extends State<ProprietorsAddress> {
  final TextEditingController emailController = TextEditingController();
  int selectedValue = 0;
  int selectedValuePart = 0;
  int selectedValuePrince = 0;
  void populateAddress() {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    if (nameRegNotifier.propDigitalAddressController.text.isNotEmpty) {
      setState(() {
        nameRegNotifier.propHouseNoController.text = 'Flat 12';
        nameRegNotifier.propStreetNameController.text = 'Saxel Street';
        nameRegNotifier.propCityController.text = 'Accra';
        nameRegNotifier.propCountryController.text = 'Ghana';
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
              text: 'Proprietor/Proprietress Address',
              fontSize: 18,
              textColor: Colors.black87,
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 0.008.sh,
            ),
            AppText(
              text: 'Fill in all details regarding your  address',
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
                digitalAddress: nameRegNotifier.propDigitalAddressController,
                houseNo: nameRegNotifier.propHouseNoController,
                streetName: nameRegNotifier.propStreetNameController,
                city: nameRegNotifier.propCityController,
                state: nameRegNotifier.propStateController,
                country: nameRegNotifier.propCountryController,
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
            SizedBox(
              height: 0.1.sh,
            )
          ],
        ),
      ),
    );
  }
}

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
import '../../../../../../utils/widgets/dopdownWidget.dart';

class MsmeDetails extends StatefulWidget {
  const MsmeDetails({super.key});

  @override
  State<MsmeDetails> createState() => _MsmeDetailsState();
}

class _MsmeDetailsState extends State<MsmeDetails> {
  final TextEditingController emailController = TextEditingController();
  String selectedBOP = 'Apply for BOP Now';
  final List<String> bops = [
    'Apply for BOP Now',
    'Apply for BOP Later',
    'Already have a BOP',
  ];

  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Form(
        child: FadeInUp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'MSME and BOP Details',
                fontSize: 18,
                textColor: Colors.black87,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 0.008.sh,
              ),
              AppText(
                text: 'Fill in all details regarding your MSME Details',
                fontSize: 12,
                textColor: Colors.black87,
                weight: FontWeight.w300,
                textAlign: TextAlign.left,
                textOverflow: TextOverflow.visible,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              AppText(
                text: "MSME Details",
                fontSize: 14,
                textColor: const Color.fromARGB(221, 1, 1, 1),
                weight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                child: Divider(
                  thickness: 0.4,
                  color: Colors.black26,
                ),
              ),
              CustomTextField(
                controller: nameRegNotifier.revEnvisagedController,
                hintext: 'Estimated revennue envisaged',
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please this field is empty';
                  } else {
                    return null;
                  }
                },
                lable: 'Revenue Envisaged',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.employeeNumberController,
                hintext: '50',
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please this field is empty';
                  } else {
                    return null;
                  }
                },
                lable: 'No. of Employees Envisaged',
                isForm: true,
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              AppText(
                text: "Business Operating Permit (BOP) Request",
                fontSize: 14,
                textColor: const Color.fromARGB(221, 1, 1, 1),
                weight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                child: Divider(
                  thickness: 0.4,
                  color: Colors.black26,
                ),
              ),
              dropDownWidget(
                label: 'Business Operating Permit',
                hint: 'Select',
                selectedValue: selectedBOP,
                insurance: bops,
                onSelected: (value) {
                  setState(() {
                    selectedBOP = value;
                  });
                },
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.bopRefController,
                hintext: '50',
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please this field is empty';
                  } else {
                    return null;
                  }
                },
                lable: 'Provide BOP Reference No.',
                isForm: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

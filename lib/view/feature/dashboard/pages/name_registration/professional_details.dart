import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/multiSelect_dropdown.dart';
import 'package:orc_public/utils/widgets/multi_choice_chiips.dart';
import 'package:provider/provider.dart';

import '../../../../../../controller/name_reg_provider.dart';
import '../../../../../../utils/widgets/authWedget.dart';

class ProfessionalDetailsForm extends StatefulWidget {
  const ProfessionalDetailsForm({super.key});

  @override
  State<ProfessionalDetailsForm> createState() =>
      _ProfessionalDetailsFormState();
}

class _ProfessionalDetailsFormState extends State<ProfessionalDetailsForm> {
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    nameRegNotifier.fetchIsics();
    super.initState();
  }

  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Form(
        key: nameRegNotifier.firstFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Body Details',
              fontSize: 18,
              textColor: Colors.black87,
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 0.008.sh,
            ),
            AppText(
              text:
                  'Fill in all details regarding the body you want to register',
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
              controller: nameRegNotifier.businessNameController,
              hintext: 'Enter professional body name',
              keyboardType: TextInputType.emailAddress,
              validator: (name) {
                if (name!.isEmpty) {
                  return 'Please enter a valid name';
                } else {
                  return null;
                }
              },
              lable: 'Name of Body',
              isForm: true,
            ),
            CustomTextField(
              controller: nameRegNotifier.businessTINController,
              hintext: 'Enter Type',
              keyboardType: TextInputType.emailAddress,
              validator: (name) {
                if (name!.isEmpty) {
                  return 'Please enter a valid type';
                } else {
                  return null;
                }
              },
              lable: 'Type Of Professional Body',
              isForm: true,
            ),
            CustomTextField(
              controller: nameRegNotifier.businessTINController,
              hintext: 'Enter Type',
              keyboardType: TextInputType.emailAddress,
              validator: (name) {
                if (name!.isEmpty) {
                  return 'Please enter a valid type';
                } else {
                  return null;
                }
              },
              lable: 'Nature Of Professional Body',
              isForm: true,
            ),
            SizedBox(
              height: 0.008.sh,
            ),
            MultiSelectDrop(),
            SizedBox(
              height: 0.015.sh,
            ),
            CustomTextField(
              controller: nameRegNotifier.businessTINController,
              hintext: 'Enter description...',
              keyboardType: TextInputType.emailAddress,
              max: 3,
              validator: (name) {
                if (name!.isEmpty) {
                  return 'Please enter a valid type';
                } else {
                  return null;
                }
              },
              lable: 'Company Description',
              isForm: true,
            ),
            CustomTextField(
              controller: nameRegNotifier.businessTINController,
              hintext: '',
              keyboardType: TextInputType.emailAddress,
              validator: (name) {
                if (name!.isEmpty) {
                  return 'Please enter a valid date';
                } else {
                  return null;
                }
              },
              lable: 'Date  of commencement',
              isForm: true,
            ),
          ],
        ),
      ),
    );
  }
}

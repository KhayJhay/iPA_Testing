import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/controller/name_reg_provider.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/multi_choice_chiips.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/widgets/authWedget.dart';

class ContactDetailsForm extends StatefulWidget {
  const ContactDetailsForm({super.key});

  @override
  State<ContactDetailsForm> createState() => _ContactDetailsFormState();
}

class _ContactDetailsFormState extends State<ContactDetailsForm> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Form(
        key: nameRegNotifier.thirdFormKey,
        child: FadeInUp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Contact Details',
                fontSize: 18,
                textColor: Colors.black87,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 0.008.sh,
              ),
              AppText(
                text:
                    'Please enter the contact details of the business you inted to register',
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
                controller: nameRegNotifier.phoneOneController,
                hintext: '+233 (555) 555-1234',
                keyboardType: TextInputType.phone,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please enter a valid contact';
                  } else {
                    return null;
                  }
                },
                lable: 'Phone Number',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.phoneTwoController,
                hintext: '+233 (555) 555-1234',
                keyboardType: TextInputType.phone,
                lable: 'Phone Number Two (If any)',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.mobileOneController,
                hintext: '+233 (555) 555-1234',
                keyboardType: TextInputType.phone,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please enter a valid contact';
                  } else {
                    return null;
                  }
                },
                lable: 'Mobile Number',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.mobileTwoController,
                hintext: '+233 (555) 555-1234',
                keyboardType: TextInputType.phone,
                lable: 'Mobile Number Two (If any)',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.faxController,
                hintext: '+233 (555) 555-1234',
                keyboardType: TextInputType.phone,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please enter a valid contact';
                  } else {
                    return null;
                  }
                },
                lable: 'Fax',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.emailController,
                hintext: 'johndoe@gmail.com',
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please enter a valid email';
                  } else {
                    return null;
                  }
                },
                lable: 'Email Address',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.websiteController,
                hintext: 'orc.com',
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please enter a valid website';
                  } else {
                    return null;
                  }
                },
                lable: 'Website',
                isForm: true,
              ),
              SizedBox(
                height: 0.20.sh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

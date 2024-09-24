import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/choose_file.dart';
import 'package:orc_public/utils/widgets/customButton.dart';

import '../../../../../../../utils/widgets/app_text.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class CancelRegistration extends StatefulWidget {
  const CancelRegistration({super.key});

  @override
  State<CancelRegistration> createState() => _CancelRegistrationState();
}

class _CancelRegistrationState extends State<CancelRegistration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
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
                color: Colors.red.withOpacity(0.06),
                border: Border.all(color: Colors.grey.shade200)),
            child: ListTile(
              leading: Icon(
                IconlyBold.info_circle,
                color: Colors.red,
              ),
              title: AppText(
                textAlign: TextAlign.left,
                text:
                    'Canceling this registration will delete any progress made on this form and terminate the process.',
                textColor: Colors.red,
                fontSize: 11.sp,
                textOverflow: TextOverflow.visible,
                weight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ChooseFile(
                title: 'Upload Letters of Administration or Probate'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomButton(
              deviceWidth: double.maxFinite,
              deviceHeight: 38,
              size: 13.sp,
              rad: 4,
              title: "Submit",
              color: secondaryColor,
            ),
          ),
          SizedBox(
            height: 0.02.sh,
          ),
        ],
      ),
    );
  }
}

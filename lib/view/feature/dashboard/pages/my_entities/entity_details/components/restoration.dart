import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/choose_file.dart';
import 'package:orc_public/utils/widgets/customButton.dart';

import '../../../../../../../utils/widgets/app_text.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class RestorationPage extends StatefulWidget {
  const RestorationPage({super.key});

  @override
  State<RestorationPage> createState() => _RestorationPageState();
}

class _RestorationPageState extends State<RestorationPage> {
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
                color: Colors.green.withOpacity(0.1),
                border: Border.all(color: Colors.grey.shade200)),
            child: ListTile(
              leading: Icon(
                IconlyBold.info_circle,
                color: Colors.green,
              ),
              title: AppText(
                textAlign: TextAlign.left,
                text: 'Restoring this Firm will restore the name of the Firm.',
                textColor: Colors.green,
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
            child: ChooseFile(title: 'Upload a Copy of the Court Order'),
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

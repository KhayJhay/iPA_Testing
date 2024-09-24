import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/controller/login_provider.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/customButton.dart';
import 'package:provider/provider.dart';

class GlobalBottomSheet {
  static void showCustomBottomSheet({
    required BuildContext context,
    Color backgroundColor = Colors.white,
    double elevation = 8.0,
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      builder: (BuildContext context) {
        var loginNotifier = Provider.of<LoginProvider>(context);
        return Container(
          height: 0.38.sh,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  AppText(
                    text: 'Account Not Verified',
                    textAlign: TextAlign.center,
                    fontSize: 18,
                    textOverflow: TextOverflow.visible,
                    weight: FontWeight.w600,
                    textColor: Colors.black87,
                  ),
                  SizedBox(
                    height: 0.010.sh,
                  ),
                  AppText(
                    text:
                        'Your account has not been verified with the Ecowas Card, so you cannot access this.',
                    textAlign: TextAlign.center,
                    fontSize: 13,
                    textOverflow: TextOverflow.visible,
                    weight: FontWeight.w400,
                    textColor: Colors.black87,
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  CustomButton(
                      deviceWidth: double.infinity,
                      deviceHeight: 55,
                      rad: 15,
                      size: 14,
                      color: theme.primaryColor ?? Colors.white,
                      press: () {
                        loginNotifier.logOut();
                      },
                      title: 'Verify Now'),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  CustomButton(
                      deviceWidth: double.infinity,
                      deviceHeight: 55,
                      hasBorder: true,
                      rad: 15,
                      color: Colors.white,
                      size: 14,
                      textColor: Colors.black87,
                      press: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancel'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

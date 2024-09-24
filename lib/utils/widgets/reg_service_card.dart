import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orc_public/utils/constants/app_images.dart';

import '../constants/constants.dart';
import 'app_text.dart';

class RegistrationCard extends StatelessWidget {
  final String title;
  final String value;
  bool hasLink;
  VoidCallback? press;
  RegistrationCard({
    super.key,
    required this.title,
    required this.value,
    this.hasLink = false,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          height: 0.12.sh,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 4),
            ],
            // border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                height: 0.12.sh,
                width: 5,
                color: secondaryColor,
              ),
              Expanded(
                child: Container(
                  height: 0.12.sh,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 10,
                          right: 15,
                          child: hasLink
                              ? SizedBox.shrink()
                              : Icon(
                                  FontAwesomeIcons.link,
                                  color: Colors.grey,
                                )),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset(
                            AppImages.orc,
                            color: Colors.grey.withOpacity(0.1),
                          )),
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 320,
                                  child: AppText(
                                    text: title,
                                    fontSize: 14.sp,
                                    textAlign: TextAlign.left,
                                    weight: FontWeight.w700,
                                    textColor: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.005.sh,
                                ),
                                AppText(
                                  text: value,
                                  fontSize: 12.sp,
                                  textAlign: TextAlign.left,
                                  textOverflow: TextOverflow.visible,
                                  weight: FontWeight.w400,
                                  textColor: Colors.black54,
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

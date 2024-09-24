import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/utils/constants/app_images.dart';

import '../constants/constants.dart';
import 'app_text.dart';

class MyEntityCard extends StatelessWidget {
  final VoidCallback press;
  String title;
  String type;
  double progress;
  MyEntityCard(
      {super.key,
      this.title = '',
      this.type = '',
      required this.press,
      this.progress = 1.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 0.11.sh,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              height: 0.13.sh,
              width: 5,
              color: secondaryColor,
            ),
            Expanded(
              child: Container(
                height: 0.13.sh,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      right: 15,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: theme.secondaryColor!.withOpacity(0.08)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: theme.secondaryColor,
                              size: 12,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: 'Good Standing',
                              fontSize: 13,
                              textAlign: TextAlign.left,
                              weight: FontWeight.w400,
                              textColor: theme.secondaryColor ?? Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
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
                              Container(
                                width: 200,
                                child: AppText(
                                  text: type,
                                  fontSize: 12.sp,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  textOverflow: TextOverflow.ellipsis,
                                  weight: FontWeight.w400,
                                  textColor: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 0.010.sh,
                              ),
                              SizedBox(
                                width: 220,
                                child: LinearProgressIndicator(
                                  value: progress, // Assuming 12 pages
                                  backgroundColor: Colors.grey[200],
                                  color: Theme.of(context).colorScheme.tertiary,
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 5,
            //   child: Container(
            //     height: 0.14.sh,
            //     padding: EdgeInsets.symmetric(vertical: 15),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           width: 200,
            //           child: AppText(
            //             text: title,
            //             fontSize: 16,
            //             textAlign: TextAlign.left,
            //             weight: FontWeight.w600,
            //             textColor: Colors.black87,
            //           ),
            //         ),
            //         AppText(
            //           text: 'Business Name Registration',
            //           fontSize: 11,
            //           textAlign: TextAlign.left,
            //           weight: FontWeight.w400,
            //           textColor: Colors.black54,
            //         ),
            // SizedBox(
            //   height: 0.010.sh,
            // ),
            // LinearProgressIndicator(
            //   value: progress, // Assuming 12 pages
            //   backgroundColor: Colors.grey[200],
            //   color: Theme.of(context).colorScheme.tertiary,
            //   minHeight: 8,
            //   borderRadius: BorderRadius.circular(10),
            // ),
            //       ],
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: Container(
            //       height: 0.14.sh,
            //       padding: EdgeInsets.symmetric(vertical: 15),
            //       child: Column(
            //         children: [Spacer()],
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}

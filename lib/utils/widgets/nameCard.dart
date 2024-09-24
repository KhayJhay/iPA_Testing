import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_reservation/reservation_payment.dart';

import 'app_text.dart';

class NameCard extends StatelessWidget {
  final VoidCallback press;
  final VoidCallback onExt;
  String title;
  NameCard({
    super.key,
    this.title = '',
    required this.press,
    required this.onExt,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: 0.10.sh,
        width: double.infinity,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.2, color: Colors.black26))),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 0.14.sh,
                child: Center(
                    child: Image.asset(
                  AppImages.orc,
                  color: Colors.grey.shade200,
                  scale: 1.6,
                )),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: 0.14.sh,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: AppText(
                        text: title,
                        fontSize: 16,
                        textAlign: TextAlign.left,
                        weight: FontWeight.w600,
                        textColor: Colors.black87,
                      ),
                    ),
                    AppText(
                      text: 'Date Reserved: 18th February, 2024',
                      fontSize: 11,
                      textAlign: TextAlign.left,
                      weight: FontWeight.w400,
                      textColor: Colors.black54,
                    ),
                    AppText(
                      text: 'Expiry Date: 20th September, 2024',
                      fontSize: 11,
                      textAlign: TextAlign.left,
                      weight: FontWeight.w400,
                      textColor: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  height: 0.14.sh,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      PopupMenuButton<String>(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        child: Icon(
                          CupertinoIcons.ellipsis,
                          color: Colors.grey,
                        ),
                        onSelected: (String result) {
                          // Handle your action here
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Extend name',
                            child: Row(
                              children: [
                                Icon(
                                  IconlyLight.paper_download,
                                  color: theme.primaryColor,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                AppText(
                                  text: "Extend name",
                                  textColor: theme.primaryColor ?? Colors.amber,
                                  fontSize: 14,
                                  weight: FontWeight.w400,
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.to(() => Reservation_Payment(),
                                  curve: Curves.easeInOutCubic,
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 500));
                            },
                          ),
                          PopupMenuItem<String>(
                              value: 'Delete Reserved name',
                              child: Row(
                                children: [
                                  Icon(
                                    IconlyLight.delete,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  AppText(
                                    text: "Delete name",
                                    textColor: Colors.red,
                                    fontSize: 14,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Spacer()
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

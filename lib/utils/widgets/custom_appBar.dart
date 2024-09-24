import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/view/feature/onboarding/basic_name_search.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_provider.dart';
import '../constants/app_images.dart';
import '../constants/constants.dart';
import 'app_text.dart';

class Custom_AppBar extends StatelessWidget {
  final String title;
  bool hasBackbtn;
  bool hasAction;
  VoidCallback? backBtn;
  Custom_AppBar({
    super.key,
    required this.title,
    this.hasBackbtn = false,
    this.hasAction = false,
    this.backBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0.06.sh, 15, 0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                spreadRadius: 1),
          ],
          color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
              ? Theme.of(context).colorScheme.background
              : Colors.white,
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 0.4))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              hasBackbtn
                  ? InkWell(
                      onTap: backBtn,
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Color(0xFF09AB98).withOpacity(0.09),
                        child: Icon(
                          IconlyBold.arrow_left_2,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Image.asset(
                      AppImages.orc,
                      height: 40,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : null,
                    ),
              SizedBox(
                width: 15,
              ),
              AppText(
                text: title,
                maxLines: 1,
                weight: FontWeight.w700,
                fontSize: 18,
                textOverflow: TextOverflow.ellipsis,
                textColor: Provider.of<ThemeProvider>(context, listen: false)
                        .isDarkMode
                    ? Colors.white
                    : Colors.black,
              ),
            ],
          ),
          hasAction
              ? SizedBox.shrink()
              : Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(Bbasic_Name_Search());
                        },
                        icon: Icon(
                          IconlyLight.search,
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyLight.notification,
                          size: 25,
                        ))
                  ],
                )
        ],
      ),
    );
  }
}

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/controller/theme_provider.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:provider/provider.dart';

import '../../models/post_model.dart';
import '../constants/constants.dart';
import 'app_text.dart';

class PostCard extends StatelessWidget {
  final Post data;
  VoidCallback? press;
  VoidCallback? onImgPress;
  PostCard({
    super.key,
    required this.data,
    this.press,
    this.onImgPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 3,
                  spreadRadius: 1),
            ],
            color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.01.sh,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.orc,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'ORC',
                      weight: FontWeight.w500,
                      fontSize: 13.sp,
                      textColor: Colors.black,
                    ),
                    AppText(
                      text: 'January 19, 2024 | 10:20am',
                      weight: FontWeight.w400,
                      fontSize: 11.sp,
                      textColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: onImgPress,
                  child: Container(
                    height: 0.18.sh,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data.profileUrl),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                AppText(
                  text: '${data.post}',
                  weight: FontWeight.w400,
                  fontSize: 12,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textColor: Colors.blueGrey,
                ),
                AppText(
                  text: 'Read more',
                  weight: FontWeight.w700,
                  fontSize: 13.sp,
                  textColor: Color(0xFF09AB98),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

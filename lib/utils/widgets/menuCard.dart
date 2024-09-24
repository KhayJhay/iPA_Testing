import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_provider.dart';
import 'app_text.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  VoidCallback? press;

  // final String value;
  // final String imgUrl;
  Color color;
  Color iconColor;
  MenuCard({
    super.key,
    this.color = Colors.white,
    this.iconColor = Colors.white,
    required this.icon,
    required this.title,
    required this.description,
    this.press,

    // required this.value,
    // required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 0.18.sh,
        width: double.infinity,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black.withOpacity(0.1),
          //       blurRadius: 3,
          //       spreadRadius: 1),
          // ],
          color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
              ? Theme.of(context).colorScheme.primary
              : color,
        ),
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                left: 20,
                child: Transform.rotate(
                  angle: 30,
                  child: Icon(
                    icon,
                    size: 200,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.withOpacity(0.08)
                        : Colors.black.withOpacity(0.04),
                  ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.grey.withOpacity(0.09)
                                  : Colors.black.withOpacity(0.06),
                            ),
                            child: Icon(
                              icon,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              size: 20,
                            ),
                          ),
                          // AppText(
                          //   text: value,
                          //   fontSize: 26,
                          //   weight: FontWeight.w700,
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppText(
                        text: title,
                        fontSize: 12.sp,
                        textAlign: TextAlign.left,
                        textColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black87,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 0.002.sh,
                      ),
                      AppText(
                        text: description,
                        fontSize: 11.sp,
                        textAlign: TextAlign.left,
                        textColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white54
                                : Color.fromARGB(255, 68, 67, 67),
                        textOverflow: TextOverflow.visible,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                )),
            // Positioned(
            //     bottom: 0,
            //     child: Image.asset(
            //       imgUrl,
            //       color: Colors.white,
            //       fit: BoxFit.cover,
            //     ))
          ],
        ),
      ),
    );
  }
}

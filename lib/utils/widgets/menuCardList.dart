import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_provider.dart';
import 'app_text.dart';

class MenuCardList extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? svg;
  final String subtitle;
  VoidCallback? press;
  Color bColor;
  bool isForReq;
  bool isSelected;
  bool isPayment;
  MenuCardList(
      {super.key,
      this.icon,
      required this.title,
      this.svg,
      required this.subtitle,
      this.press,
      this.isForReq = false,
      this.isSelected = false,
      this.isPayment = false,
      this.bColor = Colors.white38});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
            onTap: press,
            selected: isSelected,
            selectedTileColor: theme.secondaryColor!.withOpacity(0.09),
            tileColor: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            leading: isPayment
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(svg ?? ''),
                  )
                : CircleAvatar(
                    radius: isForReq ? 15 : 25,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? isSelected
                                ? theme.secondaryColor
                                : Colors.grey.withOpacity(0.08)
                            : bColor,
                    child: Icon(
                      icon,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : isForReq
                              ? Colors.white
                              : Colors.black,
                      size: isForReq ? 15 : 20,
                    ),
                  ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isForReq ? 10 : 10),
              side:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                      ? BorderSide.none
                      : BorderSide(
                          color: isSelected
                              ? theme.secondaryColor ?? Colors.white
                              : Colors.grey.shade400,
                          width: isSelected ? 0.6 : 0.4),
            ),
            title: AppText(
              text: title,
              fontSize: 12.sp,
              textAlign: TextAlign.left,
              textColor:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                      ? Colors.white
                      : Colors.black,
              weight: FontWeight.w500,
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white60
                    : const Color(0xff7C7C7C),
              ),
              maxLines: 2,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff7C7C7C),
            )));
  }
}

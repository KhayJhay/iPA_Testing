import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_provider.dart';
import '../constants/constants.dart';

class Detail_Tile_Widget extends StatelessWidget {
  final String title;
  final String Subtitl;
  bool isCard;
  Detail_Tile_Widget({
    super.key,
    required this.title,
    required this.Subtitl,
    this.isCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 0.06.sh,
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
      ),
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: title,
            fontSize: 13.sp,
            textAlign: TextAlign.left,
            textColor: secondaryColor,
            maxLines: 1,
            weight: FontWeight.w500,
          ),
          AppText(
            text: Subtitl,
            fontSize: 11.sp,
            textAlign: TextAlign.left,
            textColor: Colors.black,
            textOverflow: TextOverflow.visible,
            weight: isCard ? FontWeight.w500 : FontWeight.w300,
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_provider.dart';

class Detail_Expanded_Widget extends StatelessWidget {
  final String title;
  Widget? element;
  String subtitle;
  Detail_Expanded_Widget(
      {super.key, required this.title, this.element, this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1),
        ],
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: AppText(
          text: title,
          weight: FontWeight.w600,
          textAlign: TextAlign.left,
          textColor: primaryColor,
        ),
        subtitle: AppText(
          text: subtitle,
          weight: FontWeight.w400,
          textAlign: TextAlign.left,
          textColor: primaryColor.withOpacity(0.6),
        ),
        children: [
          element ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

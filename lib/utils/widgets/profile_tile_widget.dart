import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orc_public/controller/theme_provider.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:provider/provider.dart';

class profileTile_button extends StatelessWidget {
  final IconData iconUrl;
  final String title;
  final VoidCallback? press;
  bool isModeSwitch;
  profileTile_button(
      {Key? key,
      required this.iconUrl,
      required this.title,
      this.press,
      this.isModeSwitch = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 60,
                child: Center(child: Icon(iconUrl)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: 60,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: title,
                      weight: FontWeight.w400,
                      textColor: Colors.black87,
                      fontSize: 16,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.visible,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 8),
                height: 60,
                child: Center(
                  child: isModeSwitch
                      ? Transform.scale(
                          scale: 0.8,
                          child: Switch.adaptive(
                              value: Provider.of<ThemeProvider>(
                                context,
                              ).isDarkMode,
                              onChanged: (value) => Provider.of<ThemeProvider>(
                                      context,
                                      listen: false)
                                  .toggleTheme()),
                        )
                      : const Icon(
                          CupertinoIcons.chevron_right,
                          size: 12,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

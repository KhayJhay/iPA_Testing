import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import '../../theme/apptheme.dart';
import 'app_text.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? press;
  Color color;
  Color textColor;
  bool hasBorder;
  bool isLoading;
  bool isCenter;
  double rad;
  double size;
  Widget prefix;
  Color bordercolor;
  CustomButton({
    Key? key,
    required double deviceWidth,
    required double deviceHeight,
    required this.title,
    this.press,
    this.color = Colors.white,
    this.hasBorder = false,
    this.isLoading = false,
    this.rad = 25,
    this.isCenter = false,
    this.bordercolor = Colors.grey,
    this.prefix = const SizedBox.shrink(),
    this.size = 16,
    this.textColor = Colors.white,
  })  : _deviceWidth = deviceWidth,
        _deviceHeight = deviceHeight;

  final double _deviceWidth;
  final double _deviceHeight;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = LightTheme();
    return InkWell(
      onTap: press,
      child: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(rad),
          border: hasBorder ? Border.all(width: 0.4, color: bordercolor) : null,
        ),
        child: Center(
          child: isLoading
              ? SpinKitPulse(
                  color: theme.backgroundColor,
                  size: 28,
                )
              : isCenter
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        prefix,
                        SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: title,
                          textAlign: TextAlign.center,
                          fontSize: size,
                          textOverflow: TextOverflow.ellipsis,
                          weight: FontWeight.w400,
                          textColor: textColor,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        prefix,
                        AppText(
                          text: title,
                          textAlign: TextAlign.center,
                          fontSize: size,
                          textOverflow: TextOverflow.ellipsis,
                          weight: FontWeight.w400,
                          textColor: textColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}

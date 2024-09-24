import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';

class customTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color color;
  final VoidCallback? press;
  final String hintText;
  final IconData? prefix;
  final IconData? suffx;
  final bool hasborder;
  final bool hasPrefix;
  const customTextField({
    Key? key,
    required this.controller,
    this.press,
    required this.color,
    required this.hintText,
    this.prefix,
    this.suffx,
    required this.hasborder,
    required this.hasPrefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // color: Color(0xFF06316F).withOpacity(0.09),
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: hasborder
              ? Border.all(
                  width: 0.8, color: theme.secondaryColor ?? Colors.white)
              : null),
      child: hasPrefix
          ? TextField(
              keyboardType: TextInputType.emailAddress,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: InkWell(
                  onTap: press,
                  child: Icon(
                    prefix,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: press,
                  child: Icon(
                    suffx,
                    size: 25,
                    color: theme.secondaryColor,
                  ),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: 'Poppins-Light'),
              ),
            )
          : TextField(
              keyboardType: TextInputType.emailAddress,
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: press,
                  child: Icon(
                    suffx,
                    size: 25,
                    color: theme.secondaryColor,
                  ),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: 'Poppins-Light'),
              ),
            ),
    );
  }
}

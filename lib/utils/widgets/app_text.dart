import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  double? fontSize;
  int maxLines;
  FontWeight? weight;
  TextAlign textAlign;
  TextOverflow textOverflow;
  Color textColor;
  double letterSpacing;
  AppText(
      {Key? key,
      required this.text,
      this.fontSize = 15,
      this.maxLines = 3,
      this.weight = FontWeight.w200,
      this.textOverflow = TextOverflow.ellipsis,
      this.textColor = Colors.white,
      this.letterSpacing = 1,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
        style: GoogleFonts.sunflower(
            letterSpacing: letterSpacing,
            fontSize: fontSize,
            fontWeight: weight,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : textColor)
        // TextStyle(fontSize: fontSize, fontFamily: weight, color: textColor),
        );
  }
}

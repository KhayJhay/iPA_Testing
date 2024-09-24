import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'app_text.dart';

class ChooseFile extends StatelessWidget {
  VoidCallback? press;
  // final File imageFile;
  final String title;

  ChooseFile({
    super.key,
    required this.title,
    this.press,
    // this.imageFile = File('initial_file_path.jpg'),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          weight: FontWeight.w400,
          fontSize: 14,
          textColor: Colors.black,
        ),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: press,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 25),
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: secondaryColor,
                    child: Center(
                      child: AppText(
                        text: 'Choose File',
                        weight: FontWeight.w400,
                        fontSize: 14,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      height: 50,
                      color: Colors.black.withOpacity(0.1),
                      child: Center(
                        child: AppText(
                          text: 'No file Chosen',
                          weight: FontWeight.w500,
                          fontSize: 14,
                          textColor: Colors.black,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

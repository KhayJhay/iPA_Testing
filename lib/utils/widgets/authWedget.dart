import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orc_public/utils/constants/constants.dart';

import 'app_text.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintext,
      required this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.obscureText,
      this.max = 1,
      required this.lable,
      this.isEnabled = true,
      this.isForm = false})
      : super(key: key);
  final TextEditingController controller;
  final String hintext;
  final String lable;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool isEnabled;
  int max;
  bool isForm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isForm ? 5 : 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: lable,
            textAlign: TextAlign.center,
            fontSize: 13,
            textOverflow: TextOverflow.visible,
            weight: FontWeight.w400,
            textColor: Colors.black87,
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            cursorColor: Colors.black,
            controller: controller,
            obscureText: obscureText ?? false,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: max,
            enabled: isEnabled,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: isForm
                    ? Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey.shade200
                    : Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: isForm
                      ? BorderSide.none
                      : BorderSide(color: Colors.grey.shade400, width: 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 0.7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: theme.primaryColor ?? Colors.teal, width: 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusColor: Colors.black,
                contentPadding: EdgeInsets.all(14),
                hintText: hintext,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                )),
          ),
        ],
      ),
    );
  }
}

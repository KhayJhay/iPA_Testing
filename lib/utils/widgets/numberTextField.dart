import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';

class NumberTextField extends StatelessWidget {
  const NumberTextField(
      {super.key,
      required this.number,
      required this.contactController,
      required this.lable,
      this.onInputChanged});
  final String lable;
  final PhoneNumber number;
  final TextEditingController contactController;
  final PhoneNumber? Function(PhoneNumber?)? onInputChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
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
          InternationalPhoneNumberInput(
            onInputChanged: onInputChanged,
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: SelectorConfig(
                leadingPadding: 18,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                setSelectorButtonAsPrefixIcon: true,
                useBottomSheetSafeArea: true,
                trailingSpace: false),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            initialValue: number,
            textFieldController: contactController,
            formatInput: true,
            textStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            searchBoxDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 0.7),
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
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: theme.primaryColor ?? Colors.teal, width: 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusColor: Colors.black,
                contentPadding: EdgeInsets.all(14),
                hintText: 'Search by country name or code',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                )),
            inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 0.7),
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
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: theme.primaryColor ?? Colors.teal, width: 0.7),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusColor: Colors.black,
                contentPadding: EdgeInsets.all(14),
                hintText: '54 555 0000',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400,
                )),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
        ],
      ),
    );
  }
}

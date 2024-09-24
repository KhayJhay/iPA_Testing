import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

class DatePickerField extends StatefulWidget {
  DatePickerField({super.key, this.selectedDate, required this.lable});
  final String lable;
  DateTime? selectedDate;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: widget.lable,
            textAlign: TextAlign.center,
            fontSize: 13,
            textOverflow: TextOverflow.visible,
            weight: FontWeight.w400,
            textColor: Colors.black87,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () async {
              final date = await showDatePickerDialog(
                context: context,
                initialDate: DateTime.now(),
                maxDate: DateTime.now().add(const Duration(days: 365 * 3)),
                minDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
              );
              if (date != null) {
                setState(() {
                  widget.selectedDate = date;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400, width: 0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      IconlyLight.calendar,
                      color: theme.secondaryColor,
                      size: 18,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    AppText(
                      text: widget.selectedDate == null
                          ? "MM/DD/YYYY"
                          : DateFormat(
                              'MMM dd, yy',
                            ).format(widget.selectedDate!),
                      fontSize: 14,
                      weight: FontWeight.w500,
                      textColor: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

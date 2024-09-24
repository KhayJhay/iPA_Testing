import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'app_text.dart';

class dropDownWidget extends StatefulWidget {
  final String label;
  final String hint;
  String selectedValue;
  final List<String> insurance;
  final Function(String)? onSelected;
  dropDownWidget({
    super.key,
    this.selectedValue = 'Selected Item',
    required this.insurance,
    required this.label,
    required this.hint,
    this.onSelected,
  });

  @override
  State<dropDownWidget> createState() => _dropDownWidgetState();
}

class _dropDownWidgetState extends State<dropDownWidget> {
  bool valueSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: widget.label,
          textAlign: TextAlign.center,
          fontSize: 13,
          textOverflow: TextOverflow.visible,
          weight: FontWeight.w400,
          textColor: Colors.black87,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 10),
          margin: EdgeInsets.only(bottom: 15),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              style: TextStyle(color: Colors.black, fontSize: 14),
              hint: Text(
                valueSelected ? widget.selectedValue : widget.hint,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              items: widget.insurance
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ))
                  .toList(),
              value: widget.selectedValue,
              onChanged: (String? value) {
                setState(() {
                  widget.selectedValue = value!;
                  valueSelected = true;
                });
                widget.onSelected?.call(value!);
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

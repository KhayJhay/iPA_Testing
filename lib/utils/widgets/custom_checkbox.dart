import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class CustomCheckboxListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> selectedItems;
  final String itemValue;
  Function(bool?)? onChanged;
  CustomCheckboxListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.selectedItems,
    required this.itemValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomCheckboxListTile> createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: AppText(
        textAlign: TextAlign.left,
        text: widget.title,
        weight: FontWeight.w500,
        fontSize: 13.sp,
        textColor: Colors.black,
      ),
      subtitle: AppText(
        textAlign: TextAlign.left,
        text: widget.subtitle,
        weight: FontWeight.w400,
        fontSize: 11.sp,
        textColor: Colors.grey.shade700,
      ),
      value: widget.selectedItems.contains(widget.itemValue),
      onChanged: widget.onChanged,
    );
  }
}

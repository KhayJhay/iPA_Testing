import 'package:flutter/material.dart';
import 'package:orc_public/utils/constants/constants.dart';

class CartSelector extends StatefulWidget {
  final String title;
  final VoidCallback? press;
  final int index;
  final int curentindex;
  const CartSelector(
      {super.key,
      required this.title,
      required this.index,
      required this.curentindex,
      this.press});

  @override
  State<CartSelector> createState() => _CartSelectorState();
}

class _CartSelectorState extends State<CartSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.5),
      child: GestureDetector(
        onTap: widget.press,
        child: Container(
          height: 40,
          padding: EdgeInsets.all(4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.index == widget.curentindex
                ? theme.secondaryColor
                : Colors.white,
            border: Border.all(
                width: 1, color: theme.secondaryColor ?? Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Poppins-Medium',
                color: widget.index == widget.curentindex
                    ? Colors.white
                    : theme.secondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

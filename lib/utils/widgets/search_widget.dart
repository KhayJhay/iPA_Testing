import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchMed_Widget extends StatelessWidget {
  String title;
  bool isLoading;
  Function(String?)? onFieldSubmitted;
  final TextEditingController controller;
  VoidCallback? onSearched;

  SearchMed_Widget({
    Key? key,
    this.title = "Search for a business",
    this.isLoading = false,
    this.onFieldSubmitted,
    required this.controller,
    this.onSearched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 10),
          ],
        ),
        child: TextFormField(
          // style: TextStyle(color: Colors.white),
          controller: controller,
          // onFieldSubmitted: onFieldSubmitted,
          onChanged: onFieldSubmitted,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintText: title,
            hintStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade400,
            ),
            suffixIcon: InkWell(
              onTap: onSearched,
              child: Container(
                height: 55,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : theme.primaryColor,
                ),
                child: isLoading
                    ? SpinKitRipple(
                        color: Colors.white,
                        size: 20,
                      )
                    : Icon(IconlyLight.search,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

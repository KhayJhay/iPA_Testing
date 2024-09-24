import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar extends StatelessWidget {
  final String title;
  final String message;
  bool isSuccess;
  CustomSnackBar(
      {super.key,
      required this.title,
      required this.message,
      this.isSuccess = false});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(title, message,
          backgroundColor: isSuccess ? Colors.green : Colors.red,
          colorText: Colors.white);
    });
    return Container();
  }
}

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:orc_public/utils/widgets/snackbar.dart';
import 'package:orc_public/view/feature/authentication/verification_otp.dart';

class Sms_Api {
  static Future sendSms(
    String phoneNumber,
    String message,
    BuildContext context,
    Function callback,
  ) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://sms.nalosolutions.com/smsbackend/clientapi/Resl_Nalo/send-message/?username=ORC-GHANA&password=Nalo@unit3d01&type=0&dlr=1&destination=$phoneNumber&source=ORC-GHANA&message=$message'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      callback();
      Get.to(OtpScreen(
        email: phoneNumber,
      ));
      CustomSnackBar(
        message: 'Otp code sent to your sms',
        title: 'Success',
        isSuccess: true,
      );
      return Future.value();
    } else {
      callback();
      CustomSnackBar(
        message: 'Please try again in few minutes',
        title: 'Failed',
        isSuccess: false,
      );
      print(response.reasonPhrase);
    }
  }
}

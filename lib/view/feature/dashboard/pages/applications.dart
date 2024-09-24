import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';

import '../../../../utils/widgets/customButton.dart';
import '../../../../utils/widgets/custom_appBar.dart';

class Applications extends StatefulWidget {
  const Applications({super.key});

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'My Applications',
            hasBackbtn: true,
            backBtn: () {
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 0.1.sh,
                      ),
                      Lottie.asset(
                        "assets/lotties/nodata.json",
                      ),
                      Text(
                          'You have not started any business registration yet'),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      CustomButton(
                          deviceWidth: double.infinity,
                          deviceHeight: 48,
                          rad: 10,
                          color: theme.secondaryColor ?? Colors.white,
                          title: 'Start now!'),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

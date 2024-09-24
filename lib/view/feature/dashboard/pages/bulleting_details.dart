import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';

import '../../../../models/post_model.dart';
import '../../../../utils/widgets/custom_appBar.dart';

class BulletingDetails extends StatefulWidget {
  final Post data;
  const BulletingDetails({super.key, required this.data});

  @override
  State<BulletingDetails> createState() => _BulletingDetailsState();
}

class _BulletingDetailsState extends State<BulletingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Custom_AppBar(
              title: '',
              hasBackbtn: true,
              backBtn: () {
                Navigator.pop(context);
              },
            )),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: secondaryColor.withOpacity(0.09),
              height: 0.25.sh,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.orcLogo,
                    height: 120,
                  ),
                  AppText(
                    text: 'Re: ${widget.data.post}'.toUpperCase(),
                    weight: FontWeight.w600,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: 14.sp,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 0.42.sh,
              margin: EdgeInsets.all(20),
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.data.profileUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AppText(
                text: 'Re: ${widget.data.post}',
                weight: FontWeight.w400,
                maxLines: 10,
                textAlign: TextAlign.left,
                textOverflow: TextOverflow.visible,
                fontSize: 11.sp,
                textColor: Colors.black,
              ),
            ),
          ],
        ));
  }
}

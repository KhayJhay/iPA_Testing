import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/nameCard.dart';

import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/authWedget.dart';
import '../../../../../utils/widgets/custom_appBar.dart';
import '../../dashboard.dart';

class ReservedNames extends StatefulWidget {
  bool isFromLogin;
  ReservedNames({super.key, this.isFromLogin = false});

  @override
  State<ReservedNames> createState() => _ReservedNamesState();
}

class _ReservedNamesState extends State<ReservedNames> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Reserved Names',
            hasBackbtn: true,
            backBtn: widget.isFromLogin
                ? () {
                    Get.off(() => Dashboard(),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 200));
                  }
                : () {
                    Navigator.pop(context);
                  },
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: ListView(
            children: [
              CustomTextField(
                controller: emailController,
                hintext: 'eg.ABC Ventures',
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty || !email.contains('@')) {
                    return 'Please enter a valid email';
                  } else {
                    return null;
                  }
                },
                lable: 'Search for a business name',
                isForm: true,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: 'Reserved Name History',
                  fontSize: 14,
                  textColor: Colors.black87,
                  weight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
              ListView(
                shrinkWrap: true,
                children: List.generate(
                    strings.length,
                    (index) => NameCard(
                          title: strings[index],
                          press: () {},
                          onExt: () {},
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

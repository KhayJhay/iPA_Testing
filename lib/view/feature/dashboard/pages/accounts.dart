import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../controller/login_provider.dart';
import '../../../../utils/widgets/custom_appBar.dart';
import '../../../../utils/widgets/profile_tile_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? firstName;
  String? seconndName;
  String? email;
  String? contact;
  String? idNumber;

  @override
  void initState() {
    super.initState();
    readStorage();
  }

  void readStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('first_name');
      seconndName = prefs.getString('last_name');
      email = prefs.getString('email');
      contact = prefs.getString('contact');
      idNumber = prefs.getString('id_number');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Custom_AppBar(
              title: 'Profile',
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.03.sh,
                ),
                AppText(
                  text: '${firstName} ${seconndName}'.toUpperCase(),
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  textOverflow: TextOverflow.visible,
                  weight: FontWeight.w600,
                  textColor: Colors.black87,
                ),
                AppText(
                  text: email ?? '',
                  textAlign: TextAlign.center,
                  fontSize: 11.sp,
                  textOverflow: TextOverflow.visible,
                  weight: FontWeight.w400,
                  textColor: Colors.black54,
                ),
                SizedBox(
                  height: 0.010.sh,
                ),
                FadeInUp(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Contact',
                            textAlign: TextAlign.center,
                            fontSize: 11.sp,
                            textOverflow: TextOverflow.visible,
                            weight: FontWeight.w400,
                            textColor: Colors.black54,
                          ),
                          AppText(
                            text: contact ?? '',
                            textAlign: TextAlign.center,
                            fontSize: 12.sp,
                            textOverflow: TextOverflow.visible,
                            weight: FontWeight.w500,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Ecowas Card Number',
                            textAlign: TextAlign.center,
                            fontSize: 11.sp,
                            textOverflow: TextOverflow.visible,
                            weight: FontWeight.w400,
                            textColor: Colors.black54,
                          ),
                          AppText(
                            text: idNumber ?? '',
                            textAlign: TextAlign.center,
                            fontSize: 12.sp,
                            textOverflow: TextOverflow.visible,
                            weight: FontWeight.w500,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 11),
                  child: Divider(
                    thickness: 0.2,
                    color: Colors.grey,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 120),
                  children: [
                    profileTile_button(
                      iconUrl: FontAwesomeIcons.ccVisa,
                      title: 'Payment Methods',
                      press: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PaymentMethodScreen()));
                      },
                    ),
                    profileTile_button(
                      iconUrl: IconlyBold.notification,
                      title: 'Notification',
                      press: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             Notification_Settings()));
                      },
                    ),
                    profileTile_button(
                      iconUrl: IconlyBold.shield_done,
                      title: 'Security',
                    ),
                    profileTile_button(
                      iconUrl: IconlyBold.paper,
                      title: 'Language',
                    ),
                    profileTile_button(
                      iconUrl: CupertinoIcons.brightness,
                      title: 'Dark Mode',
                      isModeSwitch: true,
                    ),
                    profileTile_button(
                      iconUrl: IconlyBold.lock,
                      title: 'Privacy Policy',
                    ),
                    profileTile_button(
                      iconUrl: IconlyBold.logout,
                      title: 'Log out',
                      press: () {
                        showCupertinoModalPopup(
                            context: context, builder: buildLogoutActionSheet);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildLogoutActionSheet(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context);
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
            onPressed: () {
              loginNotifier.logOut();
            },
            child: AppText(
              text: 'Logout',
              fontSize: 15.sp,
              weight: FontWeight.w400,
              textColor: Colors.red,
            )),
      ],
      cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: AppText(
            text: 'Cancel',
            fontSize: 15.sp,
            weight: FontWeight.w400,
            textColor: Colors.black,
          )),
    );
  }
}

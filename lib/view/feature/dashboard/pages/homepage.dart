import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/menuCardList.dart';
import 'package:orc_public/utils/widgets/menuGrid.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:orc_public/view/feature/dashboard/pages/applications.dart';
import 'package:orc_public/view/feature/dashboard/pages/entity_info_search/entity_info_search.dart';
import 'package:orc_public/view/feature/dashboard/pages/help_support/helpcenter.dart';
import 'package:provider/provider.dart';

import '../../../../controller/login_provider.dart';
import '../../../../controller/theme_provider.dart';
import '../../../../utils/widgets/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.08.sh),
          child: Custom_AppBar(
            title: 'ORC Services',
          )),
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: Image.asset(
          //     'assets/png/opat.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // loginNotifier.isVerified ? SizedBox.shrink() : VerificationBanner(),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 20, bottom: 0),
                        child: AppText(
                          text: 'What do you want to do?',
                          fontSize: 14.sp,
                          textAlign: TextAlign.left,
                          textColor:
                              Provider.of<ThemeProvider>(context, listen: false)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                          textOverflow: TextOverflow.visible,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: FadeInUp(child: MenuGrid()),
                    ),

                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 10, bottom: 10),
                        child: AppText(
                          text: 'Explore more',
                          fontSize: 15,
                          textAlign: TextAlign.left,
                          textColor:
                              Provider.of<ThemeProvider>(context, listen: false)
                                      .isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                          textOverflow: TextOverflow.visible,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 0,
                                    spreadRadius: 1),
                              ],
                              color: Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .isDarkMode
                                  ? null
                                  : Colors.white,
                            ),
                            child: MenuCardList(
                              title: 'My Applications',
                              subtitle:
                                  'Keep track of all started appliications',
                              icon: IconlyBold.document,
                              bColor: Colors.black.withOpacity(0.05),
                              press: () {
                                Get.to(() => Applications(),
                                    curve: Curves.easeInOutCubic,
                                    transition: Transition.cupertino,
                                    duration:
                                        const Duration(milliseconds: 500));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 0.015.sh,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 0,
                                    spreadRadius: 1),
                              ],
                              color: Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .isDarkMode
                                  ? null
                                  : Colors.white,
                            ),
                            child: MenuCardList(
                              title: 'Help & Support',
                              subtitle: 'Get basic tips on how the app works',
                              icon: IconlyLight.info_circle,
                              bColor: Colors.black.withOpacity(0.05),
                              press: () {
                                Get.to(() => HelpCenter(),
                                    curve: Curves.easeInOutCubic,
                                    transition: Transition.cupertino,
                                    duration:
                                        const Duration(milliseconds: 500));
                              },
                            ),
                          ),
                          SizedBox(
                            height: 0.015.sh,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 0,
                                    spreadRadius: 1),
                              ],
                              color: Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .isDarkMode
                                  ? null
                                  : Colors.white,
                            ),
                            child: MenuCardList(
                              title: 'Beneficial Ownership Search',
                              subtitle: 'Perform a business entity info search',
                              icon: IconlyBold.user_3,
                              bColor: Colors.black.withOpacity(0.05),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class VerificationBanner extends StatelessWidget {
  const VerificationBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.06.sh,
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: 'Your Account is not verified',
                textColor: Colors.white,
                fontSize: 12,
                weight: FontWeight.w400,
              ),
              AppText(
                text: 'Tap here to update your info',
                textColor: Colors.white,
                fontSize: 12,
                weight: FontWeight.w400,
              ),
            ],
          ),
          Icon(
            CupertinoIcons.shield_slash,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

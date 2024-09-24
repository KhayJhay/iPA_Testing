import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:orc_public/view/feature/onboarding/basic_name_search.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../../utils/widgets/app_text.dart';
import '../../../utils/widgets/customButton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPageIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToNextPage() {
    if (_currentPageIndex < 2) {
      _currentPageIndex++;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SizedBox(
            width: double.maxFinite,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: _deviceHeight / 1.3,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      children: const [
                        DynamicView(
                            imgString: 'assets/images/buss.jpg',
                            title:
                                'Company Registration Made Easy With The ORC App',
                            text:
                                "Discover a seamless way to register your company, manage filings, and access essential business resources."),
                        DynamicView(
                            imgString: 'assets/images/regist.jpg',
                            title: 'Run a Business Name Search',
                            text:
                                "Before registering your business, perform a thorough name search. This step ensures that your chosen name is not already in use by another entity"),
                        DynamicView(
                            imgString: 'assets/images/business.jpg',
                            title: 'Make a Reservation for Business Name',
                            text:
                                "Once you’ve performed a name search and ensured that your desired business name is unique and available, you can reserve the chosen business name."),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                        height: 8,
                        child: AnimatedSmoothIndicator(
                            activeIndex: _currentPageIndex,
                            count: 3,
                            effect: WormEffect(
                                spacing: 6,
                                activeDotColor:
                                    theme.primaryColor ?? Colors.white,
                                dotColor: Colors.grey.shade300,
                                dotHeight: 8,
                                dotWidth: 8))),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                        deviceWidth: double.infinity,
                        deviceHeight: 50,
                        rad: 15,
                        color: theme.primaryColor ?? Color(0xFF30343B),
                        press: () {
                          Get.to(SignInScreen());
                        },
                        title: 'Get Started'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ])));
  }

  /// Section Widget
  Widget _buildSkipSection(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomButton(
            deviceWidth: 180,
            title: 'Skip',
            press: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            deviceHeight: 50,
            color: const Color(0xFF30343B),
          ),
          CustomButton(
            deviceWidth: 180,
            title: 'Next',
            press: _navigateToNextPage,
            textColor: theme.primaryColor ?? Colors.white,
            deviceHeight: 50,
          ),
        ]));
  }
}

class DynamicView extends StatelessWidget {
  final String imgString;
  final String title;
  final String text;
  const DynamicView({
    Key? key,
    required this.imgString,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgString), fit: BoxFit.cover)),
            child: Container(
              height: 450,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        const SizedBox(height: 37),
        _buildInfoSection(context, title, text),
      ],
    );
  }

  /// Section Widget
  Widget _buildInfoSection(BuildContext context, String title, String text) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          AppText(
            text: title,
            textAlign: TextAlign.center,
            fontSize: 24,
            textOverflow: TextOverflow.visible,
            weight: FontWeight.w700,
            textColor: Colors.black87,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AppText(
                text: text,
                textAlign: TextAlign.center,
                fontSize: 13,
                maxLines: 4,
                textOverflow: TextOverflow.visible,
                weight: FontWeight.w400,
                textColor: Colors.black54,
              ))
        ]));
  }
}

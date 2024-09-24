import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/customButton.dart';
import 'package:orc_public/utils/widgets/custom_appBar.dart';
import 'package:orc_public/utils/widgets/search_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:orc_public/view/feature/dashboard/pages/help_support/helpcenter.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/name_registration.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_reservation/name_reservation_form.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_reservation/reservation_payment.dart';
import 'package:orc_public/view/feature/dashboard/pages/registration_services/registration_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/login_provider.dart';
import '../../../services/helpers/searches_helper.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/widgets/app_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Bbasic_Name_Search extends StatefulWidget {
  String searchedName;
  bool isFromLogin;
  Bbasic_Name_Search(
      {super.key, this.searchedName = '', this.isFromLogin = false});

  @override
  State<Bbasic_Name_Search> createState() => _Bbasic_Name_SearchState();
}

class _Bbasic_Name_SearchState extends State<Bbasic_Name_Search> {
  bool isLoading = false;

  TextEditingController _searchController = TextEditingController();
  Future<bool>? searchResult;
  late SharedPreferences prefs;
  late bool loggedIn;
  late bool isReserved;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    widget.isFromLogin
        ? setState(() {
            _searchController.text = widget.searchedName;
            searchResult = SearchesHelper.basicNameSearch(widget.searchedName);
          })
        : () {};
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getBool('loggedIn') ?? false;
    isReserved = prefs.getBool('isReserved') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.background
          : Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          padding: EdgeInsets.fromLTRB(4, 0.04.sh, 4, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    CupertinoIcons.chevron_left_circle_fill,
                    size: 32,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : theme.primaryColor,
                  )),
              TextButton(
                  onPressed: () {
                    Get.off(() => HelpCenter(),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 200));
                  },
                  child: AppText(
                    text: 'Need Assistance?',
                    fontSize: 14,
                    textColor: const Color.fromARGB(255, 47, 130, 129),
                    weight: FontWeight.w400,
                  ))
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 0.27.sh,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/regist.jpg'))),
              child: Container(
                height: 0.27.sh,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.only(top: 0.080.sh, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Basic Info Search',
                      weight: FontWeight.w800,
                      fontSize: 22.sp,
                      textColor: Colors.white,
                    ),
                    AppText(
                      text:
                          'Perform a basic information search on entity name to be registered and reserve if possibble',
                      weight: FontWeight.w400,
                      fontSize: 11.sp,
                      textColor: Colors.white,
                      textOverflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.24.sh,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SearchMed_Widget(
                  isLoading: isLoading,
                  controller: _searchController,
                  onSearched: () {
                    setState(() {
                      searchResult = SearchesHelper.basicNameSearch(
                          _searchController.text);
                    });
                  },
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: FutureBuilder<bool>(
                    future: searchResult,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: SpinKitCircle(
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25,
                        ));
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.hasData) {
                        return snapshot.data!
                            ? Center(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 0.02.sh,
                                  ),
                                  AppText(
                                    text:
                                        "Showing Results For '${_searchController.text}'",
                                    textAlign: TextAlign.left,
                                    fontSize: 18.sp,
                                    textOverflow: TextOverflow.visible,
                                    weight: FontWeight.w800,
                                    textColor: Colors.black87,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.020.sh,
                                  ),
                                  Column(
                                    children: [
                                      ResultCard(
                                          searchController: _searchController),
                                      ResultCard(
                                        searchController: _searchController,
                                        isSuggestion: true,
                                        suggestion1: () {
                                          setState(() {
                                            _searchController.text =
                                                'Search Suggestion 1';
                                            searchResult =
                                                SearchesHelper.basicNameSearch(
                                                    _searchController.text);
                                          });
                                        },
                                        suggestion2: () {
                                          setState(() {
                                            _searchController.text =
                                                'Search Suggestion 2';
                                            searchResult =
                                                SearchesHelper.basicNameSearch(
                                                    _searchController.text);
                                          });
                                        },
                                        suggestion3: () {
                                          setState(() {
                                            _searchController.text =
                                                'Search Suggestion 3';
                                            searchResult =
                                                SearchesHelper.basicNameSearch(
                                                    _searchController.text);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                            : Center(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 0.02.sh,
                                  ),
                                  AppText(
                                    text:
                                        "Showing Results For '${_searchController.text}'",
                                    textAlign: TextAlign.left,
                                    fontSize: 18.sp,
                                    textOverflow: TextOverflow.visible,
                                    weight: FontWeight.w800,
                                    textColor: Colors.black87,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Divider(
                                      thickness: 0.5,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.020.sh,
                                  ),
                                  ResultCard(
                                    searchController: _searchController,
                                    isActive: true,
                                    reserve: !loggedIn
                                        ? () async {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            await prefs.setBool(
                                                'isReserved', true);
                                            await prefs.setString('ressName',
                                                _searchController.text);
                                            LoginAlert(context, false);
                                          }
                                        : () {
                                            TermsOfUseAlert(context);
                                          },
                                    register: !loggedIn
                                        ? () async {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            await prefs.setBool(
                                                'isRegister', true);
                                            await prefs.setString('bussName',
                                                _searchController.text);
                                            LoginAlert(context, true);
                                          }
                                        : () async {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            await prefs.setString('bussName',
                                                _searchController.text);
                                            Get.to(() => RegistrationServices(),
                                                curve: Curves.easeInOutCubic,
                                                transition:
                                                    Transition.cupertino,
                                                duration: const Duration(
                                                    milliseconds: 500));
                                          },
                                  ),
                                  // CustomButton(
                                  //     press: !loggedIn
                                  //         ? () async {
                                  //             final SharedPreferences prefs =
                                  //                 await SharedPreferences
                                  //                     .getInstance();
                                  //             await prefs.setBool(
                                  //                 'isReserved', true);
                                  //             LoginAlert(context);
                                  //           }
                                  //         : () {
                                  //             TermsOfUseAlert(context);
                                  //           },
                                  //     deviceWidth: double.infinity,
                                  //     deviceHeight: 50,
                                  //     rad: 5,
                                  //     color: theme.primaryColor ?? Colors.white,
                                  //     title: 'Reserve name'),
                                ],
                              ));
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            AppText(
                              text:
                                  "Looks like you haven't made any search yet",
                              textAlign: TextAlign.left,
                              fontSize: 14.sp,
                              textOverflow: TextOverflow.visible,
                              weight: FontWeight.w500,
                              textColor: Colors.black87,
                            ),
                            SizedBox(
                              height: 0.010.sh,
                            ),
                            AppText(
                              text:
                                  "Perform a basic name search to discover if a business name is available for use or not",
                              textAlign: TextAlign.left,
                              fontSize: 12.sp,
                              textOverflow: TextOverflow.visible,
                              weight: FontWeight.w400,
                              textColor: Colors.black54,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void TermsOfUseAlert(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    String text = lorem(paragraphs: 1, words: 200);
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Stack(children: <Widget>[
              StatefulBuilder(builder: (context, StateSetter setState) {
                return AlertDialog(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  content: Container(
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      width: _width,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.orc,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText(
                                    text: "Reservation - Terms Of Use",
                                    fontSize: 15,
                                    weight: FontWeight.w600,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              height: 0.4.sh,
                              child: ListView(
                                children: [
                                  AppText(
                                    text: text,
                                    fontSize: 12,
                                    textAlign: TextAlign.start,
                                    weight: FontWeight.w300,
                                    maxLines: 15,
                                    textOverflow: TextOverflow.visible,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 0.015.sh,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          deviceWidth: 120,
                                          deviceHeight: 38,
                                          hasBorder: true,
                                          textColor: Colors.black,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Colors.white,
                                          title: 'Decline',
                                          isCenter: false,
                                          size: 12,
                                          rad: 5,
                                          press: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          deviceWidth: 120,
                                          deviceHeight: 38,
                                          isCenter: false,
                                          textColor: Colors.white,
                                          color: theme.secondaryColor ??
                                              Colors.white,
                                          title: 'Agree',
                                          size: 12,
                                          rad: 5,
                                          press: () {
                                            Get.to(() => NameReservationForm(
                                                  name: _searchController.text,
                                                ));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              }),
            ]));
  }

  void LoginAlert(BuildContext context, bool isRegister) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    String text = lorem(paragraphs: 1, words: 200);

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Stack(children: <Widget>[
              StatefulBuilder(builder: (context, StateSetter setState) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  content: Container(
                      height: 0.2.sh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      width: _width,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppImages.orc,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText(
                                    text: isRegister
                                        ? "Register ${_searchController.text}"
                                        : "Reserve ${_searchController.text}",
                                    fontSize: 15,
                                    weight: FontWeight.w600,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              height: 0.4.sh,
                              child: ListView(
                                children: [
                                  AppText(
                                    text: isRegister
                                        ? 'You have to login to register business name'
                                        : 'You have to login to reserve business name',
                                    fontSize: 12,
                                    textAlign: TextAlign.center,
                                    weight: FontWeight.w300,
                                    textOverflow: TextOverflow.visible,
                                    textColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 0.015.sh,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          deviceWidth: 120,
                                          deviceHeight: 38,
                                          hasBorder: true,
                                          textColor: Colors.white,
                                          color: Colors.red,
                                          title: 'Cancel',
                                          size: 12,
                                          rad: 5,
                                          press: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          deviceWidth: 120,
                                          deviceHeight: 38,
                                          textColor: Colors.white,
                                          color: theme.secondaryColor ??
                                              Colors.white,
                                          title: 'Login',
                                          size: 12,
                                          rad: 5,
                                          press: () {
                                            Get.off(() => SignInScreen());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              }),
            ]));
  }
}

class ResultCard extends StatelessWidget {
  bool isActive;
  bool isSuggestion;
  VoidCallback? suggestion1;
  VoidCallback? suggestion2;
  VoidCallback? suggestion3;
  VoidCallback? register;

  VoidCallback? reserve;

  ResultCard({
    super.key,
    required TextEditingController searchController,
    this.isActive = false,
    this.isSuggestion = false,
    this.suggestion1,
    this.suggestion2,
    this.suggestion3,
    this.register,
    this.reserve,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 5,
              color: isSuggestion
                  ? primaryColor
                  : isActive
                      ? Colors.green
                      : Colors.red,
            ),
            Expanded(
              child: Container(
                color: isSuggestion
                    ? primaryColor.withOpacity(0.04)
                    : isActive
                        ? Colors.green.withOpacity(0.04)
                        : Colors.red.withOpacity(0.04),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        text: isSuggestion
                            ? 'Here are some great suggestions'
                            : isActive
                                ? 'Spot on 🔥! "${_searchController.text}" Can be used'
                                : 'Unfortunately 😞, "${_searchController.text}" is not accepted',
                        fontSize: 14.sp,
                        textOverflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                        weight: FontWeight.w700,
                        textColor: Colors.black,
                      ),
                      SizedBox(height: 0.005.sh),
                      isSuggestion
                          ? Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 250,
                                      child: AppText(
                                        text:
                                            "Choose the suggestions which best suite you business name",
                                        fontSize: 12.sp,
                                        textAlign: TextAlign.left,
                                        textOverflow: TextOverflow.visible,
                                        weight: FontWeight.w400,
                                        textColor: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    CustomButton(
                                      deviceWidth: 230,
                                      deviceHeight: 30,
                                      hasBorder: true,
                                      size: 15,
                                      rad: 5,
                                      press: suggestion1,
                                      prefix: Icon(
                                        IconlyLight.search,
                                        color: primaryColor,
                                        size: 13,
                                      ),
                                      textColor: primaryColor,
                                      bordercolor: primaryColor,
                                      title: 'Search suggestion 1',
                                    ),
                                    SizedBox(height: 0.010.sh),
                                    CustomButton(
                                      deviceWidth: 230,
                                      deviceHeight: 30,
                                      size: 15,
                                      hasBorder: true,
                                      rad: 5,
                                      press: suggestion2,
                                      prefix: Icon(
                                        IconlyLight.search,
                                        color: primaryColor,
                                        size: 13,
                                      ),
                                      textColor: primaryColor,
                                      bordercolor: primaryColor,
                                      title: 'Search suggestion 2',
                                    ),
                                    SizedBox(height: 0.010.sh),
                                    CustomButton(
                                      deviceWidth: 230,
                                      deviceHeight: 30,
                                      hasBorder: true,
                                      press: suggestion3,
                                      size: 15,
                                      rad: 5,
                                      prefix: Icon(
                                        IconlyLight.search,
                                        color: primaryColor,
                                        size: 13,
                                      ),
                                      textColor: primaryColor,
                                      bordercolor: primaryColor,
                                      title: 'Search suggestion 3',
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Icon(
                                  FontAwesomeIcons.lightbulb,
                                  color: primaryColor,
                                  size: 70,
                                )
                              ],
                            )
                          : isActive
                              ? Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AppText(
                                          text:
                                              "How will you like to proceed ?",
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.left,
                                          textOverflow: TextOverflow.visible,
                                          weight: FontWeight.w400,
                                          textColor: Colors.black54,
                                        ),
                                        SizedBox(height: 0.01.sh),
                                        CustomButton(
                                          deviceWidth: 200,
                                          deviceHeight: 30,
                                          rad: 5,
                                          press: register,
                                          title: 'Register Name',
                                          color: Colors.green,
                                        ),
                                        SizedBox(height: 10),
                                        CustomButton(
                                          deviceWidth: 200,
                                          deviceHeight: 30,
                                          hasBorder: true,
                                          rad: 5,
                                          press: reserve,
                                          textColor: Colors.green,
                                          bordercolor: Colors.green,
                                          title: 'Reserve Name',
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Lottie.asset(
                                          "assets/lotties/check.json",
                                          height: 90,
                                        )),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: "* Try another search",
                                          fontSize: 12.sp,
                                          textAlign: TextAlign.left,
                                          textOverflow: TextOverflow.visible,
                                          weight: FontWeight.w400,
                                          textColor: Colors.black54,
                                        ),
                                        Container(
                                          width: 255,
                                          child: AppText(
                                            text:
                                                "* Or search with the suggestions below",
                                            fontSize: 12.sp,
                                            textAlign: TextAlign.left,
                                            textOverflow: TextOverflow.visible,
                                            weight: FontWeight.w400,
                                            textColor: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Lottie.asset(
                                      "assets/lotties/wrong.json",
                                      height: 70,
                                    ),
                                  ],
                                ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

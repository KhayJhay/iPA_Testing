import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/models/business_name_model.dart';
import 'package:orc_public/models/business_reg_response.dart';
import 'package:orc_public/models/entity_model.dart';
import 'package:orc_public/services/helpers/searches_helper.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/webview_constants.dart';
import 'package:orc_public/utils/widgets/entity_Card.dart';
import 'package:orc_public/utils/widgets/nameCard.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:orc_public/utils/widgets/reg_service_card.dart';
import 'package:orc_public/utils/widgets/search_widget.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';
import 'package:orc_public/view/feature/dashboard/pages/entity_info_search/entity_request_doc.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/registration_guidlines.dart';
import 'package:orc_public/view/feature/dashboard/pages/registration_services/registration_webview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/authWedget.dart';
import '../../../../../utils/widgets/customButton.dart';
import '../../../../../utils/widgets/custom_appBar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationServices extends StatefulWidget {
  const RegistrationServices({super.key});

  @override
  State<RegistrationServices> createState() => _RegistrationServicesState();
}

class _RegistrationServicesState extends State<RegistrationServices> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  List<BusinessName> filteredSearch = [];
  final searchKey = GlobalKey<FormState>();
  bool isSearched = false;
  void _filterData(value) {
    setState(() {
      isSearched = true;
      filteredSearch = businessNames
          .where(
              (item) => item.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  final Uri _urlorc = Uri.parse(
      'https://dev.synkcodes.com/instructions/company-limitedby-shares');

  Future<void> _launchORCServices() async {
    if (!await launchUrl(_urlorc)) {
      throw 'Could not launch $_urlorc ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Registration Services',
            hasBackbtn: true,
            backBtn: () {
              quitAlert(context);
            },
          )),
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: Image.asset(
          //     'assets/png/pat.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 0.27.sh,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bgImg.jpg'))),
              child: Container(
                height: 0.27.sh,
                width: double.infinity,
                color: Colors.black.withOpacity(0.2),
                padding: EdgeInsets.only(top: 0.080.sh, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      child: AppText(
                        text: 'Registration Services',
                        weight: FontWeight.w800,
                        fontSize: 22.sp,
                        textColor: Colors.white,
                      ),
                    ),
                    FadeInUp(
                      child: AppText(
                        text:
                            'Perform a business registeration using one of the available registeration service in the provided list.',
                        weight: FontWeight.w400,
                        fontSize: 11.sp,
                        textColor: Colors.white,
                        textOverflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                      ),
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
                FadeInUp(
                  child: SearchMed_Widget(
                    controller: searchController,
                    title: 'Search for a service name',
                    onFieldSubmitted: _filterData,
                    onSearched: () {
                      if (searchController.text.isNotEmpty) {
                        EasyLoading.show(status: 'Searching...');

                        EasyLoading.dismiss();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        text: 'AVAILABLE SERVICES',
                        fontSize: 13.sp,
                        textAlign: TextAlign.left,
                        weight: FontWeight.w800,
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.6.sh,
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 120),
                    children: isSearched
                        ? List.generate(filteredSearch.length, (index) {
                            return FadeInUp(
                              child: RegistrationCard(
                                hasLink: filteredSearch[index].name ==
                                    "Registration of Business Names",
                                title: filteredSearch[index].name,
                                value: filteredSearch[index].description,
                                press: () {
                                  switch (filteredSearch[index].name) {
                                    case "Registration of Business Names":
                                      Get.to(() => RegistrationGuidelines(
                                            registrationType:
                                                businessNameRegistration,
                                          ));
                                      break;
                                    default:
                                      _launchORCServices();
                                      break;
                                  }
                                },
                              ),
                            );
                          })
                        : List.generate(businessNames.length, (index) {
                            return FadeInUp(
                              child: RegistrationCard(
                                hasLink: businessNames[index].name ==
                                        "Registration of Business Names" ||
                                    businessNames[index].name ==
                                        "Registration of Professional Bodies",
                                title: businessNames[index].name,
                                value: businessNames[index].description,
                                press: () {
                                  print(WebViewUrls.compLimitedByShares);
                                  switch (businessNames[index].name) {
                                    case "Registration of Business Names":
                                      Get.to(() => RegistrationGuidelines(
                                            registrationType:
                                                businessNameRegistration,
                                          ));
                                      break;
                                    case "Registration of Professional Bodies":
                                      Get.to(() => RegistrationGuidelines(
                                            registrationType:
                                                professionalBodiessRegistration,
                                          ));
                                      break;
                                    case "Company Limited by Shares":
                                      Get.to(() => Registratio_Webview(
                                            webUrl:
                                                WebViewUrls.compLimitedByShares,
                                          ));
                                      break;
                                    case "Public Company Unlimited by Shares":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls
                                                .pubUnlimiteddByShares,
                                          ));
                                      break;
                                    case "Public Company Limited by Share":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls
                                                .privateUnlimiteddByShares,
                                          ));
                                      break;
                                    case "Private Company Limited by Guarantee":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls
                                                .privatelimiteddByShares,
                                          ));
                                      break;
                                    case "Partnerships":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls.partnerships,
                                          ));
                                      break;
                                    case "External Company":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls.externalComps,
                                          ));
                                      break;
                                    case "Public Company Limited by Guarantee":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls.pubGuarantee,
                                          ));
                                      break;
                                    case "Private Company Unlimited by Shares":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls
                                                .privateUnlimiteddByShares,
                                          ));
                                      break;
                                    case "Corporate Business Names":
                                      Get.to(() => Registratio_Webview(
                                            webUrl: WebViewUrls.subsidiary,
                                          ));
                                      break;
                                    default:
                                      _launchORCServices();
                                      break;
                                  }
                                },
                              ),
                            );
                          }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void quitAlert(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
                      height: 0.18.sh,
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
                                    text: "Quit Registration",
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
                                    text:
                                        'Do you want to quit name registration?',
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
                                          title: 'Proceed',
                                          size: 12,
                                          rad: 5,
                                          press: () async {
                                            final SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.remove('bussName');
                                            Get.off(
                                                () => Dashboard(
                                                      selectedIndex: 1,
                                                    ),
                                                transition:
                                                    Transition.leftToRight,
                                                duration: const Duration(
                                                    milliseconds: 200));
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

  void TermsOfUseAlert(BuildContext context, EntityModel data) {
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
                      height: 0.5.sh,
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
                                    text: "Entity Request - Terms Of Use",
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
                                          color: Colors.white,
                                          title: 'Decline',
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
                                          title: 'Agree',
                                          size: 12,
                                          rad: 5,
                                          press: () {
                                            Get.to(() => Entity_Request(
                                                  data: data,
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
}

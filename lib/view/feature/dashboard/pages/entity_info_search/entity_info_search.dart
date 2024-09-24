import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/models/business_reg_response.dart';
import 'package:orc_public/models/entity_model.dart';
import 'package:orc_public/services/helpers/searches_helper.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/entity_Card.dart';
import 'package:orc_public/utils/widgets/nameCard.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:orc_public/utils/widgets/search_widget.dart';
import 'package:orc_public/view/feature/dashboard/pages/entity_info_search/entity_request_doc.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/authWedget.dart';
import '../../../../../utils/widgets/customButton.dart';
import '../../../../../utils/widgets/custom_appBar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Entity_Info_Search extends StatefulWidget {
  const Entity_Info_Search({super.key});

  @override
  State<Entity_Info_Search> createState() => _Entity_Info_SearchState();
}

class _Entity_Info_SearchState extends State<Entity_Info_Search> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  Future<List<EntityModel>>? searchResults;
  final searchKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Entity Info Search',
            hasBackbtn: true,
            backBtn: () {
              Navigator.pop(context);
            },
          )),
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
                  color: Colors.black.withOpacity(0.1),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/buss.jpg'))),
              child: Container(
                height: 0.27.sh,
                width: double.infinity,
                color: Colors.black.withOpacity(0.6),
                padding: EdgeInsets.only(top: 0.080.sh, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Detailed Info Search',
                      weight: FontWeight.w800,
                      fontSize: 22.sp,
                      textColor: Colors.white,
                    ),
                    AppText(
                      text:
                          'Perform a detailed information search on entity name to be registered and reserve if possibble',
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
                  controller: searchController,
                  onSearched: () {
                    if (searchController.text.isNotEmpty) {
                      EasyLoading.show(status: 'Searching...');

                      setState(() {
                        searchResults = SearchesHelper.entityInfoSearch(
                            searchController.text);
                      });

                      EasyLoading.dismiss();
                    }
                  },
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: FutureBuilder<List<EntityModel>>(
                    future: searchResults,
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            AppText(
                              text:
                                  "Showing Results For '${searchController.text}'",
                              textAlign: TextAlign.left,
                              fontSize: 18.sp,
                              textOverflow: TextOverflow.visible,
                              weight: FontWeight.w800,
                              textColor: Colors.black87,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            SizedBox(
                              height: 0.020.sh,
                            ),
                            SizedBox(
                              height: 0.4.sh,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  var business = snapshot.data![index];
                                  return EntityCard(
                                    data: business,
                                    // Add other fields as necessary
                                    press: () =>
                                        TermsOfUseAlert(context, business),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
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

      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      //     child: Form(
      //       key: searchKey,
      //       child: ListView(
      //         children: [
      //           Row(
      //             children: [
      //               Expanded(
      //                 flex: 6,
      //                 child: CustomTextField(
      //                   controller: searchController,
      //                   hintext: 'eg.ABC Ventures',
      //                   keyboardType: TextInputType.emailAddress,
      //                   validator: (email) {
      //                     if (email!.isEmpty) {
      //                       return 'Search field is empty';
      //                     } else {
      //                       return null;
      //                     }
      //                   },
      //                   lable: 'Search Info',
      //                   isForm: true,
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 15,
      //               ),
      //               Expanded(
      //                   child: GestureDetector(
      //                 onTap: () {
      // if (searchKey.currentState!.validate()) {
      //   EasyLoading.show(status: 'Searching...');

      //   setState(() {
      //     searchResults = SearchesHelper.entityInfoSearch(
      //         searchController.text);
      //   });

      //   EasyLoading.dismiss();
      // }
      //                 },
      //                 child: Container(
      //                   height: 50,
      //                   width: 50,
      //                   margin: EdgeInsets.only(top: 20),
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10),
      //                       color: Theme.of(context).colorScheme.secondary),
      //                   child: Center(
      //                     child: Icon(
      //                       IconlyLight.search,
      //                       color: Colors.white,
      //                       size: 20,
      //                     ),
      //                   ),
      //                 ),
      //               ))
      //             ],
      //           ),
      //           SizedBox(
      //             height: 0.015.sh,
      //           ),
      // FutureBuilder<List<EntityModel>>(
      //   future: searchResults,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //           child: SpinKitCircle(
      //         color: Theme.of(context).colorScheme.secondary,
      //         size: 25,
      //       ));
      //     } else if (snapshot.hasError) {
      //       return Text("Error: ${snapshot.error}");
      //     } else if (snapshot.hasData) {
      //       return Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Align(
      //             alignment: Alignment.centerLeft,
      //             child: AppText(
      //               text:
      //                   'Entity Search Results for ${searchController.text}',
      //               fontSize: 14,
      //               textColor: Colors.black87,
      //               weight: FontWeight.w400,
      //             ),
      //           ),
      //           SizedBox(
      //             height: 0.01.sh,
      //           ),
      //           SizedBox(
      //             height: 0.7.sh,
      //             child: ListView.builder(
      //               shrinkWrap: true,
      //               itemCount: snapshot.data!.length,
      //               itemBuilder: (context, index) {
      //                 var business = snapshot.data![index];
      //                 return EntityCard(
      //                   data: business,
      //                   // Add other fields as necessary
      //                   press: () =>
      //                       TermsOfUseAlert(context, business),
      //                 );
      //               },
      //             ),
      //           ),
      //         ],
      //       );
      //     } else {
      //       return Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           SizedBox(
      //             height: 0.1.sh,
      //           ),
      //           Lottie.asset(
      //             "assets/lotties/search.json",
      //             height: 130,
      //           ),
      //           SizedBox(
      //             height: 0.03.sh,
      //           ),
      //           AppText(
      //             text: "Looks like you haven't made any search yet",
      //             textAlign: TextAlign.center,
      //             fontSize: 14,
      //             textOverflow: TextOverflow.visible,
      //             weight: FontWeight.w500,
      //             textColor: Colors.black87,
      //           ),
      //           SizedBox(
      //             height: 0.010.sh,
      //           ),
      //         ],
      //       );
      //     }
      //   },
      // ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
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
                      height: 0.38.sh,
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
                                    text:
                                        "We are committed to protecting the privacy and confidentiality of all information provided through the Service.To Ensure this we need you to commit to the following: The legal documents provided through our Service are for informational purposes only and do not constitute legal advice. You agree to use the documents at your own risk and to consult with a qualified attorney if you have any legal questions or concerns The legal documents provided through our Service are for informational purposes only and do not constitute legal advice. You agree to use the documents at your own risk and to consult with a qualified attorney if you have any legal questions or concerns By requesting a document through our Service, you acknowledge that you have read, understood, and agree to be bound by these Terms. If you do not agree to these Terms, please do not proceed with your request.",
                                    fontSize: 12,
                                    textAlign: TextAlign.start,
                                    weight: FontWeight.w300,
                                    textOverflow: TextOverflow.visible,
                                    maxLines: 12,
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

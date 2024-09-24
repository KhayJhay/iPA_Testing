import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:orc_public/models/business_name_model.dart';
import 'package:orc_public/models/business_reg_response.dart';
import 'package:orc_public/models/entity_model.dart';
import 'package:orc_public/services/helpers/searches_helper.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/entity_Card.dart';
import 'package:orc_public/utils/widgets/nameCard.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:orc_public/utils/widgets/reg_service_card.dart';
import 'package:orc_public/utils/widgets/search_widget.dart';
import 'package:orc_public/view/feature/dashboard/pages/entity_info_search/entity_request_doc.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/annual_renewal.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/cancel_registration.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/change_in_particulars.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/comapny_profile.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/company_details.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/print_documents.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/restoration.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/components/transactions.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/registration_guidlines.dart';
import 'package:orc_public/view/feature/dashboard/pages/registration_services/registration_webview.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../../../controller/theme_provider.dart';
import '../../../../../../utils/widgets/app_text.dart';
import '../../../../../../utils/widgets/customButton.dart';
import '../../../../../../utils/widgets/custom_appBar.dart';
import '../../../../../../utils/widgets/detail_expanded_widget.dart';
import '../../../../../../utils/widgets/detail_tile_widget.dart';

class Entity_MainPage extends StatefulWidget {
  final String title;
  const Entity_MainPage({super.key, required this.title});

  @override
  State<Entity_MainPage> createState() => _Entity_MainPageState();
}

class _Entity_MainPageState extends State<Entity_MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Custom_AppBar(
            title: widget.title,
            hasBackbtn: true,
            backBtn: () {
              Navigator.pop(context);
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
              height: 0.24.sh,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/bgImg.jpg')),
              ),
              child: Container(
                height: 0.21.sh,
                width: double.infinity,
                color: Colors.black.withOpacity(0.4),
                padding: EdgeInsets.only(top: 0.050.sh, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Entity name:',
                      weight: FontWeight.w400,
                      fontSize: 13.sp,
                      textColor: Colors.white,
                    ),
                    AppText(
                      text: 'TesMeMa Multimedia',
                      weight: FontWeight.w600,
                      fontSize: 15.sp,
                      textColor: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 220.0),
                      child: Divider(
                        thickness: 0.4,
                        color: Colors.white,
                      ),
                    ),
                    AppText(
                      text: 'Entity type:',
                      weight: FontWeight.w400,
                      fontSize: 13.sp,
                      textColor: Colors.white,
                    ),
                    AppText(
                      text: 'Business name registration',
                      weight: FontWeight.w600,
                      fontSize: 15.sp,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 0.2.sh,
              left: 15,
              right: 15,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: 0.08.sh,
                      decoration: BoxDecoration(
                        color:
                            Provider.of<ThemeProvider>(context, listen: false)
                                    .isDarkMode
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 10),
                        ],
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Detail_Tile_Widget(
                            isCard: true,
                            title: 'Reg No.',
                            Subtitl: 'RGD-000001',
                          ),
                          Detail_Tile_Widget(
                            isCard: true,
                            title: 'CIN',
                            Subtitl: 'CRG-000001',
                          ),
                          Detail_Tile_Widget(
                            isCard: true,
                            title: 'Since.',
                            Subtitl: '19/05/2009',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    if (widget.title == 'Entity Details')
                      const Company_Details_Component(),
                    if (widget.title == 'Company Profile')
                      const CompanyProfile(),
                    if (widget.title == 'Change in particulars')
                      const ChangeInParticulars(),
                    if (widget.title == 'Annual Renewal') const AnnualRenewal(),
                    if (widget.title == 'Transactions') const Trannsactions(),
                    if (widget.title == 'Print Document')
                      const PrintDocuments(),
                    if (widget.title == 'Cancel Registration')
                      const CancelRegistration(),
                    if (widget.title == 'Restoration') const RestorationPage(),
                    if (widget.title == 'Close Down') const CancelRegistration()
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

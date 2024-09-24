import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/widgets/menuCard.dart';
import 'package:orc_public/utils/widgets/verifyBottomSheet.dart';
import 'package:orc_public/view/feature/dashboard/pages/applications.dart';
import 'package:orc_public/view/feature/dashboard/pages/entity_info_search/entity_info_search.dart';
import 'package:orc_public/view/feature/dashboard/pages/help_support/helpcenter.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/my_entities_page.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/name_registration.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/registration_guidlines.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_reservation/reserved_names.dart';
import 'package:orc_public/view/feature/dashboard/pages/registration_services/registration_services.dart';
import 'package:provider/provider.dart';

import '../../controller/login_provider.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context, listen: false);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 15),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        MenuCard(
          icon: IconlyBold.edit,
          title: 'Registration Services',
          description: 'Register your business name here',
          color: Color(0xFFF6ECF8),
          press: () {
            Get.to(() => RegistrationServices(),
                curve: Curves.easeInOutCubic,
                transition: Transition.zoom,
                duration: const Duration(milliseconds: 500));
          },
        ),
        MenuCard(
          icon: IconlyBold.paper_download,
          title: 'Reserved Names',
          description: 'Search and make a name reservation',
          color: Color.fromARGB(255, 249, 249, 241),
          press: () {
            Get.to(() => ReservedNames(),
                curve: Curves.easeInOutCubic,
                transition: Transition.zoom,
                duration: const Duration(milliseconds: 500));
          },
        ),
        MenuCard(
          icon: IconlyBold.search,
          title: 'Entity Enquiry',
          description: 'Make enquiries about registered businesses',
          color: Color.fromARGB(255, 239, 253, 242),
          press: () {
            Get.to(() => Entity_Info_Search(),
                curve: Curves.easeInOutCubic,
                transition: Transition.zoom,
                duration: const Duration(milliseconds: 500));
          },
        ),
        MenuCard(
          icon: IconlyBold.work,
          title: 'My Entities',
          description: 'Track the progress of all added entities',
          color: Color(0xFFEDF7FE),
          press: () {
            Get.to(() => MyEntitiesPage(),
                curve: Curves.easeInSine,
                transition: Transition.zoom,
                duration: const Duration(milliseconds: 500));
          },
        ),
      ],
    );
  }
}

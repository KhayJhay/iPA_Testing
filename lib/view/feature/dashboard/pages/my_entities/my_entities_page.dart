import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/dashboard/pages/help_support/contact_us.dart';
import 'package:orc_public/view/feature/dashboard/pages/help_support/faq_screen.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/completed_entitied.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/inprogress_entities.dart';

import '../../../../../utils/widgets/custom_appBar.dart';

class MyEntitiesPage extends StatefulWidget {
  const MyEntitiesPage({super.key});

  @override
  State<MyEntitiesPage> createState() => _MyEntitiesPageState();
}

class _MyEntitiesPageState extends State<MyEntitiesPage> {
  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Custom_AppBar(
                hasBackbtn: true,
                backBtn: () {
                  Navigator.pop(context);
                },
                title: 'My Entities',
              )),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBar(
                          // unselectedLabelColor: Colors.grey,
                          // indicatorColor: theme.primaryColor,
                          // indicatorWeight: 3,
                          unselectedLabelStyle: GoogleFonts.sunflower(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          labelStyle: GoogleFonts.sunflower(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          // labelColor: theme.primaryColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              text: 'In progress',
                            ),
                            Tab(
                              text: 'Completed',
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: _deviceHeight * 0.8,
                    child: const TabBarView(children: [
                      InprogressEntities(),
                      CompletedEntities(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

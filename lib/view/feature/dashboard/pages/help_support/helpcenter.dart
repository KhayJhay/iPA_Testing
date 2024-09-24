import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/dashboard/pages/help_support/contact_us.dart';
import 'package:orc_public/view/feature/dashboard/pages/help_support/faq_screen.dart';

import '../../../../../utils/widgets/custom_appBar.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
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
                title: 'Help Center',
                hasBackbtn: true,
                backBtn: () {
                  Navigator.pop(context);
                },
              )),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.4))),
                      child: TabBar(
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: theme.primaryColor,
                          indicatorWeight: 3,
                          unselectedLabelStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins-SemiBold',
                          ),
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                              fontFamily: 'Poppins-SemiBold'),
                          labelColor: theme.primaryColor,
                          tabs: [
                            Tab(
                              text: 'FAQ',
                            ),
                            Tab(
                              text: 'Contact us',
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: _deviceHeight * 0.8,
                    child: const TabBarView(children: [
                      FAQ_Screen(),
                      ContactUs_Page(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

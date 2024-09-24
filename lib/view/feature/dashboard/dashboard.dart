import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/controller/login_provider.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/dashboard/pages/accounts.dart';
import 'package:orc_public/view/feature/dashboard/pages/applications.dart';
import 'package:orc_public/view/feature/dashboard/pages/bulleting_feeds.dart';
import 'package:orc_public/view/feature/dashboard/pages/homepage.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/my_entities_page.dart';
import 'package:orc_public/view/feature/dashboard/pages/services.dart';
import 'package:provider/provider.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import '../../../utils/widgets/verifyBottomSheet.dart';

class Dashboard extends StatefulWidget {
  int selectedIndex;
  Dashboard({Key? key, this.selectedIndex = 0});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    // var loginNotifier = Provider.of<LoginProvider>(context, listen: false);
    // if (index == 1 || index == 3 && loginNotifier.isVerified == false) {
    //   GlobalBottomSheet.showCustomBottomSheet(context: context);
    // } else {
    //   setState(() {
    //     widget.selectedIndex = index;
    //   });
    // }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginProvider>(context);
    final List<Widget> _navScreens = <Widget>[
      BulletingFeeds(),
      Homepage(),
      ServicesPage(),
      AccountPage(),
    ];
    return Scaffold(
      body: _navScreens.elementAt(widget.selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 0.4))),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: theme.bottomIconColor ?? Colors.white,
          currentIndex: widget.selectedIndex,
          unselectedLabelStyle: GoogleFonts.lora(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: theme.bottomIconColor ?? Colors.white,
          ),
          selectedLabelStyle: GoogleFonts.lora(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: theme.primaryColor,
          ),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: 'Home',
                activeIcon: Icon(IconlyBold.home)),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.work),
                label: 'Services',
                activeIcon: Icon(IconlyBold.work)),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.discovery),
                label: 'Discover',
                activeIcon: Icon(IconlyBold.discovery)),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.setting),
                label: 'Account',
                activeIcon: Icon(IconlyBold.setting)),
          ],
          selectedItemColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : theme.primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:orc_public/controller/login_provider.dart';
import 'package:orc_public/controller/name_reg_provider.dart';
import 'package:orc_public/controller/theme_provider.dart';
import 'package:orc_public/services/helpers/auth_helper.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/view/feature/authentication/sign_in.dart';
import 'package:orc_public/view/feature/dashboard/dashboard.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'controller/signup_provider.dart';
import 'view/feature/onboarding/onboarding.dart';

Widget defaultHome = const OnboardingScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final entrypoint = prefs.getBool('entrypoint') ?? false;
  final loggedIn = prefs.getBool('loggedIn') ?? false;

  if (entrypoint & !loggedIn) {
    defaultHome = SignInScreen();
  } else if (entrypoint && loggedIn) {
    defaultHome = Dashboard();
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SignupNotifier()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => NameRegProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: 'ORC Public',
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeProvider>(
              context,
            ).themeData,
            home: CheckSession(),
            builder: EasyLoading.init(),
          );
        });
  }
}

class CheckSession extends StatefulWidget {
  const CheckSession({Key? key});

  @override
  State<CheckSession> createState() => _CheckSessionState();
}

class _CheckSessionState extends State<CheckSession> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      AuthHelper.checkTokenExpiration().then((value) {
        if (value) {
          logOut();
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
      });
    });

    super.initState();
  }

  void logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: "Logging Out...");
    await prefs.clear();

    prefs.setBool('loggedIn', false);
    prefs.setBool('entrypoint', false);
    EasyLoading.dismiss();
    Get.off(() => OnboardingScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Image.asset(
                AppImages.orcLogo,
                height: 100,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 120,
            child: SpinKitChasingDots(
              size: 30,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

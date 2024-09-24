import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/controller/theme_provider.dart';
import 'package:orc_public/utils/widgets/custom_appBar.dart';
import 'package:orc_public/view/feature/dashboard/pages/bulleting_details.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../models/post_model.dart';
import '../../../../utils/widgets/postcard.dart';

class BulletingFeeds extends StatefulWidget {
  const BulletingFeeds({super.key});

  @override
  State<BulletingFeeds> createState() => _BulletingFeedsState();
}

class _BulletingFeedsState extends State<BulletingFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.08.sh),
          child: Custom_AppBar(
            title: 'Home',
          )),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                ? SizedBox.shrink()
                : Image.asset(
                    'assets/png/opat.png',
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 20),
                    itemCount: demoPosts.length,
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        child: PostCard(
                          data: demoPosts[index],
                          onImgPress: () {
                            showFeedsIImageAlert(
                                context, demoPosts[index].profileUrl);
                          },
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BulletingDetails(
                                          data: demoPosts[index],
                                        )));
                          },
                        ),
                      );
                    })),
          ),
        ],
      ),
    );
  }

  void showFeedsIImageAlert(BuildContext context, String ImgUrl) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.black,
              child: Container(
                width: double.maxFinite,
                height: 0.5.sh,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(ImgUrl), // Replace with your image asset
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ));
  }
}

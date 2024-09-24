import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/models/registration_type.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:flutter/services.dart';
import 'package:orc_public/utils/widgets/customButton.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/name_reg_payment.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../../utils/widgets/menuCardList.dart';

class RegistrationGuidelines extends StatefulWidget {
  final RegistrationType registrationType;
  const RegistrationGuidelines({super.key, required this.registrationType});

  @override
  State<RegistrationGuidelines> createState() => _RegistrationGuidelinesState();
}

class _RegistrationGuidelinesState extends State<RegistrationGuidelines> {
  late YoutubePlayerController _controller;
  bool isFullScreen = false;

  late List<bool> selectedItems;

  bool _acceptedTerms = false;

  void _onTermsChanged(bool? value) => setState(() => _acceptedTerms = value!);

  @override
  void initState() {
    super.initState();
    selectedItems = List<bool>.filled(
        widget.registrationType.documentsRequired.length, false);
    _controller = YoutubePlayerController(
      initialVideoId: widget.registrationType.videoID,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller.addListener(() {
      if (_controller.value.isFullScreen != isFullScreen) {
        setState(() {
          isFullScreen = _controller.value.isFullScreen;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: primaryColor,
            elevation: 0,
            pinned: true,
            centerTitle: true,
            expandedHeight: 300,
            excludeHeaderSemantics: true,
            leadingWidth: 30,
            title: AppText(
              text: 'Registration Guidelines',
              weight: FontWeight.w500,
              letterSpacing: 2,
              fontSize: 16,
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                IconlyBold.arrow_left_2,
                size: 30,
                color: Colors.white,
              ),
            ),
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Container(
                height: double.infinity,
                decoration: BoxDecoration(),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true, // Optional progress bar
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    child: AppText(
                      text: widget.registrationType.title,
                      weight: FontWeight.w700,
                      textColor: primaryColor,
                      fontSize: 18,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    height: 0.008.sh,
                  ),
                  FadeInUp(
                    child: AppText(
                      text: widget.registrationType.description,
                      weight: FontWeight.w300,
                      textColor: Colors.black87,
                      fontSize: 14,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    height: 0.020.sh,
                  ),
                  FadeInUp(
                    child: AppText(
                      text: 'Fees & Payments',
                      weight: FontWeight.w700,
                      textColor: primaryColor,
                      fontSize: 18,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    height: 0.008.sh,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.registrationType.pricing
                          .map((price) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FadeInUp(
                                  child: pricingCard(
                                    title: price.title,
                                    subTitle: price.subTitle,
                                    price: price.price,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  FadeInUp(
                    child: AppText(
                      text: 'Registration Procedure',
                      weight: FontWeight.w700,
                      textColor: primaryColor,
                      fontSize: 18,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.visible,
                    ),
                  ),
                  ...widget.registrationType.procedures.map((proc) => FadeInUp(
                        child: ProcedureTile(
                          number: proc.number,
                          title: proc.title,
                        ),
                      )),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  FadeInUp(
                    child: AppText(
                      text: 'Documents Required',
                      weight: FontWeight.w700,
                      textColor: primaryColor,
                      fontSize: 18,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.visible,
                    ),
                  ),
                  FadeInUp(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        text:
                            'Check the required documents below and select the documents you have available at the moment ',
                        weight: FontWeight.w300,
                        textColor: Colors.black87,
                        fontSize: 14,
                        textAlign: TextAlign.left,
                        textOverflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.015.sh,
                  ),
                  SizedBox(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20),
                      children: List.generate(
                          widget.registrationType.documentsRequired.length,
                          (index) => FadeInUp(
                                child: MenuCardList(
                                    press: () {
                                      setState(() {
                                        selectedItems[index] =
                                            !selectedItems[index];
                                      });
                                    },
                                    bColor: selectedItems[index]
                                        ? theme.secondaryColor ?? Colors.white
                                        : Colors.grey.shade300,
                                    icon: selectedItems[index]
                                        ? Icons.check
                                        : Icons
                                            .check, // Change icon based on selection
                                    isSelected: selectedItems[index],
                                    title: widget.registrationType
                                        .documentsRequired[index],
                                    isForReq: true,
                                    subtitle: widget.registrationType
                                        .documentsDescription[index]),
                              )),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        child: AppText(
                          text:
                              'Please read and accept the terms and conditions before proceeding.',
                          weight: FontWeight.w300,
                          textColor: Colors.black87,
                          fontSize: 14,
                          textAlign: TextAlign.left,
                          textOverflow: TextOverflow.visible,
                        ),
                      ),
                      FadeInUp(
                        child: CheckboxListTile(
                          title: AppText(
                            text: 'I agree to the terms and conditions.',
                            weight: FontWeight.w300,
                            textColor: Colors.black87,
                            fontSize: 14,
                            textAlign: TextAlign.left,
                            textOverflow: TextOverflow.visible,
                          ),
                          value: _acceptedTerms,
                          onChanged: _onTermsChanged,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  FadeInUp(
                    child: CustomButton(
                      deviceWidth: double.infinity,
                      rad: 25,
                      deviceHeight: 55,
                      title: 'Continue',
                      press: _acceptedTerms
                          ? () {
                              Get.to(
                                  () => Name_Reg_Payment(
                                        title: widget.registrationType.title,
                                      ),
                                  curve: Curves.easeInOutCubic,
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 500));
                            }
                          : () {},
                      color:
                          _acceptedTerms ? primaryColor : Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    height: 0.1.sh,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _handleNext() {
    // Handle proceeding to the next step after terms are accepted
    // (e.g., navigate to a new screen, perform an action)
    print('Terms accepted, proceeding...');
  }
}

class pricingCard extends StatelessWidget {
  final String title;
  final String price;
  IconData icon;
  Color color;
  String subTitle;
  pricingCard(
      {super.key,
      required this.title,
      required this.price,
      this.icon = IconlyBold.activity,
      this.color = Colors.black,
      this.subTitle = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.2.sh,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 3),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            height: 0.010.sh,
          ),
          AppText(
            text: title,
            weight: FontWeight.w700,
            textColor: Colors.black,
            fontSize: 16,
            textOverflow: TextOverflow.visible,
          ),
          AppText(
            text: price,
            weight: FontWeight.w800,
            textColor: primaryColor,
            fontSize: 26,
            textOverflow: TextOverflow.visible,
          ),
          SizedBox(
            height: 0.010.sh,
          ),
          AppText(
            text: subTitle,
            weight: FontWeight.w300,
            textColor: Colors.black54,
            fontSize: 10.sp,
            textAlign: TextAlign.left,
            textOverflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}

class ProcedureTile extends StatelessWidget {
  final String number;
  final String title;
  const ProcedureTile({
    super.key,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: primaryColor,
        child: AppText(
          text: number,
          weight: FontWeight.w500,
          textColor: Colors.white,
          fontSize: 18,
          textAlign: TextAlign.left,
          textOverflow: TextOverflow.visible,
        ),
      ),
      title: AppText(
        text: title,
        weight: FontWeight.w300,
        textColor: Colors.black87,
        fontSize: 14,
        textAlign: TextAlign.left,
        textOverflow: TextOverflow.visible,
      ),
      minLeadingWidth: 20,
    );
  }
}

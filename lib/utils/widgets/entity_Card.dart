import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orc_public/models/business_reg_response.dart';
import 'package:orc_public/models/entity_model.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/customButton.dart';

import 'app_text.dart';

class EntityCard extends StatelessWidget {
  final VoidCallback press;
  final EntityModel data;
  const EntityCard({super.key, required this.press, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.2, color: Colors.black26))),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor:
                                  theme.secondaryColor!.withOpacity(0.08),
                              child: Icon(
                                FontAwesomeIcons.hotel,
                                color: theme.secondaryColor,
                                size: 15,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            AppText(
                              text: data.name ?? '',
                              fontSize: 16,
                              textAlign: TextAlign.left,
                              weight: FontWeight.w600,
                              textColor: Colors.black87,
                            ),
                          ],
                        ),
                        Container(
                          width: 80,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: theme.secondaryColor!.withOpacity(0.08)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.brightness_1,
                                color: theme.secondaryColor,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: 'Active',
                                fontSize: 13,
                                textAlign: TextAlign.left,
                                weight: FontWeight.w400,
                                textColor: theme.secondaryColor ?? Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.010.sh,
                  ),
                  AppText(
                    text: 'Incorporated on - 18th February, 2024',
                    fontSize: 12,
                    textAlign: TextAlign.left,
                    weight: FontWeight.w400,
                    textColor: Colors.black54,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: AppText(
                      text: 'Company Type: ${data.businessType}',
                      fontSize: 12,
                      textAlign: TextAlign.left,
                      weight: FontWeight.w400,
                      textColor: Colors.black54,
                    ),
                  ),
                  AppText(
                    text: 'TIN Number: 9182988',
                    fontSize: 12,
                    textAlign: TextAlign.left,
                    weight: FontWeight.w400,
                    textColor: Colors.black54,
                  ),
                  SizedBox(
                    height: 0.020.sh,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          deviceWidth: 120,
                          deviceHeight: 38,
                          rad: 5,
                          size: 11,
                          color: theme.primaryColor ?? Colors.white,
                          press: press,
                          title: 'Request Info'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

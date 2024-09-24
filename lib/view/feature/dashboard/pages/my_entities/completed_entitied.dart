import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orc_public/utils/widgets/menuCardList.dart';
import 'package:orc_public/view/feature/dashboard/pages/my_entities/entity_details/entity_detail_page.dart';

import '../../../../../models/action_model.dart';
import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/my_entity_card.dart';
import '../../../../../utils/widgets/nameCard.dart';

class CompletedEntities extends StatelessWidget {
  const CompletedEntities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        shrinkWrap: true,
        children: List.generate(
            myEntities.length,
            (index) => MyEntityCard(
                  press: () {
                    showActionBottomSheet(context, myEntities[index].name,
                        myEntities[index].description);
                  },
                  title: myEntities[index].name,
                  type: myEntities[index].description,
                )),
      ),
    );
  }

  void showActionBottomSheet(BuildContext context, String title, String type) {
    List<ActionModel> filteredActions;
    if (type == 'Sole Proprietorship') {
      filteredActions = entityActions
          .where((action) =>
              action.name == 'Entity Details' ||
              action.name == 'Company Profile' ||
              action.name == 'Change in particulars' ||
              action.name == 'Annual Renewal' ||
              action.name == 'Transactions' ||
              action.name == 'Print Document' ||
              action.name == 'Cancel Registration' ||
              action.name == 'Restoration' ||
              action.name == 'Close Down')
          .toList();
    } else {
      // Adjust this else block to handle different types or default cases
      filteredActions = entityActions;
    }
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              height: 0.7.sh,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: AppText(
                        text: '$title',
                        weight: FontWeight.w800,
                        fontSize: 18.sp,
                        textColor: Colors.black,
                      ),
                    ),
                    AppText(
                      text: "Perform the actions below on this entity",
                      weight: FontWeight.w400,
                      fontSize: 10.sp,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.visible,
                      textColor: Colors.black54,
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    SizedBox(
                      height: 0.7.sh,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 320),
                        children:
                            List.generate(filteredActions.length, (index) {
                          return Column(
                            children: [
                              MenuCardList(
                                isSelected: true,
                                bColor: secondaryColor.withOpacity(0.08),
                                title: filteredActions[index].name,
                                subtitle: filteredActions[index].description,
                                icon: filteredActions[index].icons,
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Entity_MainPage(
                                              title: filteredActions[index]
                                                  .name)));
                                },
                              ),
                              Divider(
                                thickness: 0.2,
                                color: Colors.grey.shade400,
                              )
                            ],
                          );
                        }),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
      isScrollControlled: true,
    );
  }
}

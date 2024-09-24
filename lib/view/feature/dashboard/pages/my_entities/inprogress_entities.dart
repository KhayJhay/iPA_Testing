import 'package:flutter/cupertino.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/my_entity_card.dart';

import '../../../../../utils/widgets/nameCard.dart';

class InprogressEntities extends StatelessWidget {
  const InprogressEntities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView(
        shrinkWrap: true,
        children: List.generate(
            strings.length,
            (index) => MyEntityCard(
                  press: () {},
                  progress: 0.5,
                  title: strings[index],
                )),
      ),
    );
  }
}

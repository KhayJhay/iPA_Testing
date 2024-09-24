import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/models/entity_model.dart';
import 'package:orc_public/utils/constants/app_images.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/entity_Card.dart';
import 'package:orc_public/utils/widgets/menuCardList.dart';
import 'package:orc_public/utils/widgets/nameCard.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:orc_public/view/feature/dashboard/pages/entity_info_search/entity_payment.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/authWedget.dart';
import '../../../../../utils/widgets/customButton.dart';
import '../../../../../utils/widgets/custom_appBar.dart';

class Entity_Request extends StatefulWidget {
  final EntityModel data;
  const Entity_Request({super.key, required this.data});

  @override
  State<Entity_Request> createState() => _Entity_RequestState();
}

class _Entity_RequestState extends State<Entity_Request> {
  int current = 0;
  final TextEditingController emailController = TextEditingController();
  List<bool> selectedItems;
  String selectedPrice = '';
  List<String> requests = [
    "Director's Information",
    "Secretary's Information",
    "Auditor's Information",
    "Beneficial Owner's Information",
  ];
  List<String> requestsPrices = [
    "50",
    "20",
    "20",
    "30",
  ];
  List<String> requestsDesc = [
    "Request for company Director's Information",
    "Request for company Secretary's Information",
    "Request for company  Auditor's Information",
    "Request for Beneficial Owner's Information",
  ];
  _Entity_RequestState() : selectedItems = List.filled(4, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Custom_AppBar(
            title: 'Entity Request Document',
            hasBackbtn: true,
            hasAction: true,
            backBtn: () {
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: '${widget.data.name}'.toUpperCase(),
                  fontSize: 14,
                  textColor: Colors.black87,
                  weight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: 'Please select the information you are\ninterested in',
                  fontSize: 14,
                  textOverflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  textColor: Colors.black87,
                  weight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              ListView(
                shrinkWrap: true,
                children: List.generate(
                    requests.length,
                    (index) => MenuCardList(
                        press: () {
                          setState(() {
                            selectedItems[index] = !selectedItems[index];
                          });
                        },
                        bColor: selectedItems[index]
                            ? theme.secondaryColor ?? Colors.white
                            : Colors.grey.shade300,
                        icon: selectedItems[index]
                            ? Icons.check
                            : Icons.check, // Change icon based on selection
                        isSelected: selectedItems[index],
                        title: requests[index],
                        isForReq: true,
                        subtitle: requestsDesc[index])),
              ),
              SizedBox(
                height: 0.04.sh,
              ),
              CustomButton(
                  deviceWidth: double.infinity,
                  deviceHeight: 50,
                  rad: 15,
                  color: theme.primaryColor ?? Colors.white,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Entity_Payment()));
                  },
                  title: 'Proceed'),
            ],
          ),
        ),
      ),
    );
  }
}

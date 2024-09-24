import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../../../../utils/widgets/category_widget.dart';
import '../../../../../utils/widgets/textFieldWidget.dart';

class FAQ_Screen extends StatefulWidget {
  const FAQ_Screen({super.key});

  @override
  State<FAQ_Screen> createState() => _FAQ_ScreenState();
}

class _FAQ_ScreenState extends State<FAQ_Screen> {
  String text = lorem(paragraphs: 1, words: 30);
  var _searchController = TextEditingController();
  late int curentindex = 0;
  final List<String> cartList = [
    "General",
    "Account",
    "Service",
    "Payment",
  ];
  final List<String> questionsList = [
    "How to use ORC mobbile?",
    "How do I register a Company?",
    "Is ORC Mobile free to use?",
    "How to make a business name search",
  ];
  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0.02.sh,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: customTextField(
              controller: _searchController,
              color: Colors.grey.shade200,
              hintText: 'Search',
              hasborder: false,
              hasPrefix: true,
              suffx: IconlyBold.filter,
              prefix: IconlyLight.search,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: _deviceHeight * 0.175,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFF09AB98).withOpacity(0.09),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 0.8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'How does ORC mobile work?',
                        ),
                        Icon(
                          IconlyBold.arrow_down_2,
                          color: Colors.black87,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: _deviceHeight * 0.4,
              width: _deviceWidth,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: questionsList.length,
                itemBuilder: (_, index) =>
                    faqCard(_deviceHeight, questionsList[index]),
                // categorySelector('${cartList[index]}', index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container faqCard(double _deviceHeight, String title) {
    return Container(
      height: _deviceHeight * 0.08,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xFF09AB98).withOpacity(0.09),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
            ),
            Icon(
              IconlyBold.arrow_down_2,
            )
          ],
        ),
      ),
    );
  }
}

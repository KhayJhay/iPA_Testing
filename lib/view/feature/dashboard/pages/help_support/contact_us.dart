import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orc_public/utils/constants/constants.dart';

class ContactUs_Page extends StatefulWidget {
  const ContactUs_Page({super.key});

  @override
  State<ContactUs_Page> createState() => _ContactUs_PageState();
}

class _ContactUs_PageState extends State<ContactUs_Page> {
  List<String> _contactList = [
    'Customer Services',
    'WhatsApp',
    'Website',
    'Facebook',
    'Twitter',
    'Instagram',
  ];
  List<IconData> _icons = [
    FontAwesomeIcons.headphones,
    FontAwesomeIcons.whatsapp,
    FontAwesomeIcons.internetExplorer,
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.instagram,
  ];
  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: _deviceHeight * 0.6,
              width: _deviceWidth,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _contactList.length,
                itemBuilder: (_, index) => contactCard(
                    _deviceHeight, _contactList[index], _icons[index]),
                // categorySelector('${cartList[index]}', index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container contactCard(double _deviceHeight, String title, IconData icon) {
    return Container(
      height: _deviceHeight * 0.07,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Color(0xFF09AB98).withOpacity(0.09),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(
              icon,
              color: theme.primaryColor,
              size: 18,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}

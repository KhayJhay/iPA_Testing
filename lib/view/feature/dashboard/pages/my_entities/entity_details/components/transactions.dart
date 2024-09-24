import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/models/trannsaction_model.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';

class Trannsactions extends StatefulWidget {
  const Trannsactions({super.key});

  @override
  State<Trannsactions> createState() => _TrannsactionsState();
}

class _TrannsactionsState extends State<Trannsactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                children: [
                  AppText(
                    text: 'Approved',
                    textColor: Colors.black,
                    fontSize: 16,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    IconlyLight.arrow_down_2,
                    size: 18,
                    color: Colors.grey,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 0.6),
                borderRadius: BorderRadius.circular(2),
              ),
            )
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: List.generate(transactions.length,
              (index) => Transaction_Tile(data: transactions[index])),
        )
      ],
    );
  }
}

class Transaction_Tile extends StatelessWidget {
  final TransactionModel data;
  const Transaction_Tile({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: secondaryColor.withOpacity(0.1),
        child: Icon(
          IconlyLight.activity,
          size: 24,
          color: Colors.black,
        ),
      ),
      title: AppText(
        textAlign: TextAlign.left,
        text: '${data.transactionType}',
        textColor: Colors.black,
        fontSize: 15,
        weight: FontWeight.w500,
      ),
      subtitle: AppText(
        textAlign: TextAlign.left,
        text: '${data.updatedAt}',
        textColor: Colors.black54,
        fontSize: 12.sp,
      ),
      trailing: AppText(
        text: '${data.status}',
        textColor: data.status == "Rejected"
            ? Colors.red
            : data.status == "Pending"
                ? Colors.amber
                : Colors.green,
        fontSize: 16,
        weight: FontWeight.w600,
      ),
    );
  }
}

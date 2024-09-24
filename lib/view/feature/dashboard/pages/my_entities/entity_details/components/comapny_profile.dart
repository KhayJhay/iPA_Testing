import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../../../../../../controller/theme_provider.dart';
import '../../../../../../../utils/widgets/app_text.dart';
import '../../../../../../../utils/widgets/detail_expanded_widget.dart';
import '../../../../../../../utils/widgets/detail_tile_widget.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 10),
        ],
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child: AppText(
              text: 'Company Profile',
              weight: FontWeight.w700,
              fontSize: 15.sp,
              textColor: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 8.0),
            child: Divider(
              thickness: 0.3,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                border: Border.all(color: Colors.grey.shade200)),
            child: ListTile(
              leading: Icon(
                IconlyBold.info_circle,
                color: Colors.green,
              ),
              title: AppText(
                textAlign: TextAlign.left,
                text:
                    'The information below is a brief description about your company',
                textColor: Colors.green,
                fontSize: 11.sp,
                textOverflow: TextOverflow.visible,
                weight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Detail_Tile_Widget(
                title: 'Level One Approval',
                Subtitl: 'Johny Keys',
              ),
              Detail_Tile_Widget(
                title: 'Office Location',
                Subtitl: 'Kumasi',
              ),
            ],
          ),
          Row(
            children: [
              Detail_Tile_Widget(
                title: 'Company  Profile Status',
                Subtitl: 'Good Standing',
              ),
              Detail_Tile_Widget(
                title: 'Company Status',
                Subtitl: 'Active',
              ),
            ],
          ),
          Row(
            children: [
              Detail_Tile_Widget(
                title: 'Renewal Due Date',
                Subtitl: '12/12/2026',
              ),
              Detail_Tile_Widget(
                title: 'Renewal Overdue',
                Subtitl: 'No',
              ),
            ],
          ),
          Row(
            children: [
              Detail_Tile_Widget(
                title: 'Years Renewal Overdue',
                Subtitl: 'N/A',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

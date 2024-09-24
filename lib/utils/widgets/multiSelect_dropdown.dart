import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:orc_public/controller/name_reg_provider.dart';
import 'package:orc_public/models/sector_model.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class MultiSelectDrop extends StatefulWidget {
  const MultiSelectDrop({super.key});

  @override
  State<MultiSelectDrop> createState() => _MultiSelectDropState();
}

class _MultiSelectDropState extends State<MultiSelectDrop> {
  final MultiSelectController<SectorModel> _controller =
      MultiSelectController();
  @override
  void initState() {
    super.initState();
    fetchIsic();
  }

  void fetchIsic() {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    nameRegNotifier.fetchIsics();
  }

  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    return !nameRegNotifier.loading
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Select ISIC Code',
                textAlign: TextAlign.center,
                fontSize: 13,
                textOverflow: TextOverflow.visible,
                weight: FontWeight.w400,
                textColor: Colors.black87,
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  fetchIsic();
                },
                child: MultiSelectDropDown<SectorModel>(
                  controller: _controller,
                  searchEnabled: true,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade400,
                  ),
                  fieldBackgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade200,
                  borderColor: Theme.of(context).brightness == Brightness.dark
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade200,
                  onOptionSelected: (options) {
                    setState(() {
                      nameRegNotifier.selectedIsics = options
                          .map((e) => e.value!.code)
                          .toList()
                          .cast<String>();
                    });
                  },
                  hint: 'ISIC Code',
                  options: nameRegNotifier.isics
                      .map((sector) => ValueItem(
                          label: "${sector.code}-${sector.name}",
                          value: sector))
                      .toList(),
                  selectionType: SelectionType.multi,
                  chipConfig: ChipConfig(
                      wrapType: WrapType.wrap,
                      backgroundColor: theme.secondaryColor),
                  dropdownHeight: 300,
                  optionTextStyle: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),
            ],
          )
        : ShimmerPro.sized(
            borderRadius: 15,
            light: ShimmerProLight.lighter,
            scaffoldBackgroundColor: Colors.grey.shade400,
            height: 55,
            width: double.infinity,
          );
  }
}

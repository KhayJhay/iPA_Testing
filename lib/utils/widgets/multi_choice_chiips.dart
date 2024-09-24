import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:orc_public/models/sector_model.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import '../../controller/name_reg_provider.dart';
import '../constants/constants.dart';
import 'app_text.dart';

class MultiSelectChips extends StatefulWidget {
  MultiSelectChips({
    super.key,
  });
  @override
  _MultiSelectChipsState createState() => _MultiSelectChipsState();
}

class _MultiSelectChipsState extends State<MultiSelectChips> {
  // This list will hold the selected options.
  final MultiSelectController<SectorModel> _controller =
      MultiSelectController();
  @override
  void initState() {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    super.initState();
    nameRegNotifier.fetchSectors();
  }

  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    return !nameRegNotifier.loading
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Select Business Sectors',
                textAlign: TextAlign.center,
                fontSize: 13,
                textOverflow: TextOverflow.visible,
                weight: FontWeight.w400,
                textColor: Colors.black87,
              ),
              SizedBox(
                height: 8,
              ),
              MultiSelectDropDown<SectorModel>(
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
                    nameRegNotifier.selectedOptions =
                        options.map((e) => e.label).toList().cast<String>();
                  });
                },
                hint: 'Business Sectors',
                options: nameRegNotifier.options
                    .map((sector) =>
                        ValueItem(label: sector.name ?? '', value: sector))
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

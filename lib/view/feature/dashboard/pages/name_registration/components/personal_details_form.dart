import 'package:animate_do/animate_do.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/controller/name_reg_provider.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/multi_choice_chiips.dart';
import 'package:provider/provider.dart';
import 'package:country_state_city/country_state_city.dart' as cState;
import '../../../../../../controller/theme_provider.dart';
import '../../../../../../utils/widgets/authWedget.dart';
import '../../../../../../utils/widgets/customButton.dart';
import '../../../../../../utils/widgets/dopdownWidget.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({super.key});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final TextEditingController emailController = TextEditingController();
  String selectedTitle = 'Mr';
  final List<String> titles = [
    'Mr',
    'Mrs',
    'Miss',
    'Ms',
    'Dr',
  ];

  String selectedGender = 'Male';
  final List<String> genders = [
    'Male',
    'Female',
  ];
  String? selectedCountry;
  List<String> countryList = [];

  Future<void> fetchCountries() async {
    final countries = await cState.getAllCountries();
    setState(() {
      countryList = countries.map((country) => country.name).toList();
    });
  }

  void populateGHANACARD() {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    if (nameRegNotifier.propGhaaCardController.text.isNotEmpty) {
      setState(() {
        selectedTitle = 'Mrs';
        selectedGender = 'Female';
        nameRegNotifier.propfirstNameontroller.text = 'Priscilla';
        nameRegNotifier.proplastNameController.text = 'Aboagyewaa';
        nameRegNotifier.propOccupationController.text = 'Fashion Designer';
        selectedCountry = 'Ghana';
        nameRegNotifier.propCountry2Controller.text = 'Ghana';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    return SingleChildScrollView(
      child: FadeInUp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Personal Information',
              fontSize: 18,
              textColor: Colors.black87,
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 0.008.sh,
            ),
            AppText(
              text: 'Please enter your personal details appropriately',
              fontSize: 12,
              textColor: Colors.black87,
              weight: FontWeight.w300,
              textAlign: TextAlign.left,
              textOverflow: TextOverflow.visible,
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    controller: nameRegNotifier.propGhaaCardController,
                    hintext: 'GHA-XXXXXXXXXXX-X',
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Please this field is empty';
                      } else {
                        return null;
                      }
                    },
                    lable: 'Ghana Card',
                    isForm: true,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomButton(
                      color: primaryColor,
                      rad: 8,
                      deviceWidth: 150,
                      deviceHeight: 50,
                      press: () => populateGHANACARD(),
                      size: 14.sp,
                      prefix: Icon(
                        IconlyBold.shield_done,
                        size: 20,
                        color: Colors.white,
                      ),
                      title: 'Verify'),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: dropDownWidget(
                    label: 'Title',
                    hint: 'Select a title',
                    selectedValue: selectedTitle,
                    insurance: titles,
                    onSelected: (value) {
                      setState(() {
                        selectedTitle = value;
                        nameRegNotifier.proptitleController.text =
                            selectedTitle;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: dropDownWidget(
                    label: 'Gender',
                    hint: 'Select a gender',
                    selectedValue: selectedGender,
                    insurance: genders,
                    onSelected: (value) {
                      setState(() {
                        selectedGender = value;
                        nameRegNotifier.propGenderController.text =
                            selectedGender;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            CustomTextField(
              controller: nameRegNotifier.propfirstNameontroller,
              hintext: 'Enter first name',
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email!.isEmpty) {
                  return 'Please this field is empty';
                } else {
                  return null;
                }
              },
              lable: 'First Name',
              isForm: true,
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            CustomTextField(
              controller: nameRegNotifier.proplastNameController,
              hintext: 'Enter last name',
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email!.isEmpty) {
                  return 'Please this field is empty';
                } else {
                  return null;
                }
              },
              lable: 'Last Name',
              isForm: true,
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            CustomTextField(
              controller: nameRegNotifier.propOccupationController,
              hintext: 'Your Occupation',
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email!.isEmpty) {
                  return 'Please enter a valid occupation';
                } else {
                  return null;
                }
              },
              lable: 'Occupation',
              isForm: true,
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            AppText(
              text: 'Country',
              textAlign: TextAlign.center,
              fontSize: 13,
              textOverflow: TextOverflow.visible,
              weight: FontWeight.w400,
              textColor: Colors.black87,
            ),
            SizedBox(
              height: 8,
            ),
            CustomDropdown.search(
              overlayHeight: 0.4.sh,
              excludeSelected: false,
              decoration: CustomDropdownDecoration(
                  expandedFillColor:
                      Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                          ? Theme.of(context).colorScheme.background
                          : Colors.grey.shade200,
                  closedFillColor:
                      Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                          ? Theme.of(context).colorScheme.background
                          : Colors.grey.shade200,
                  expandedBorderRadius: BorderRadius.circular(10),
                  closedSuffixIcon: Icon(Icons.arrow_drop_down),
                  listItemStyle: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                          ? Colors.grey
                          : Colors.black54,
                      fontSize: 14),
                  headerStyle: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                          ? Colors.grey
                          : Colors.black54,
                      fontSize: 14),
                  hintStyle: TextStyle(
                      color: Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkMode
                          ? Colors.grey
                          : Colors.black54,
                      fontSize: 14),
                  closedBorderRadius: BorderRadius.circular(10)),
              hintText: 'Select Country',
              items: countryList,
              initialItem: selectedCountry,
              onChanged: (value) async {
                setState(() {
                  selectedCountry = value!;
                  nameRegNotifier.propCountry2Controller.text =
                      selectedCountry ?? '';
                });
              },
            ),
            SizedBox(
              height: 0.15.sh,
            ),
          ],
        ),
      ),
    );
  }
}

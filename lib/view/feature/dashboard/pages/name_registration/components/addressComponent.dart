import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/controller/name_reg_provider.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/authWedget.dart';
import 'package:orc_public/utils/widgets/customButton.dart';
import 'package:country_state_city/country_state_city.dart' as cState;
import 'package:provider/provider.dart';
import '../../../../../../controller/theme_provider.dart';
import '../../../../../../utils/widgets/app_text.dart';
import '../../../../../../utils/widgets/dopdownWidget.dart';

class AddressForm extends StatefulWidget {
  final TextEditingController digitalAddress;
  final TextEditingController houseNo;
  final TextEditingController streetName;
  final TextEditingController city;
  final String title;
  VoidCallback? press;
  VoidCallback? verify;
  TextEditingController? country;
  TextEditingController? state;
  GlobalKey<FormState>? formKey;
  AddressForm(
      {super.key,
      required this.digitalAddress,
      required this.houseNo,
      required this.streetName,
      required this.city,
      this.title = '',
      this.press,
      this.country,
      this.state,
      this.verify});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<String> countryList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  Future<void> fetchCountries() async {
    final countries = await cState.getAllCountries();
    setState(() {
      countryList = countries.map((country) => country.name).toList();
    });
  }

  Future<void> fetchStates(String countryCode) async {
    final states = await cState.getStatesOfCountry(countryCode);
    setState(() {
      stateList = states.map((state) => state.name).toList();
      selectedState = null; // Reset the state dropdown
      selectedCity = null; // Reset the city dropdown
      cityList = []; // Clear the city list
    });
  }

  Future<void> fetchCities(String countryCode, String stateCode) async {
    final cities = await cState.getCountryCities(countryCode);
    setState(() {
      cityList = cities.map((city) => city.name).toList();
      selectedCity = null; // Reset the city dropdown
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountries();
  }

  String selectedRegion = 'Ahafo';
  final List<String> region = [
    'Ahafo',
    'Ashanti',
    'Bono',
    'Bono East',
    'Central',
    'Eastern',
    'Greater Accra',
    'North East',
    'Northern',
    'Oti',
    'Savannah',
    'Upper East',
    'Upper West',
    'Volta',
    'Western',
    'Western North',
  ];
  String selectedDistrict = 'Accra Metropolitan';
  final List<String> districts = [
    'Accra Metropolitan',
    'Tema Metropolitan',
    'Ga South',
    'Ga Central',
    'Ga East',
    'Ga West'
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: widget.title,
            fontSize: 14,
            textColor: const Color.fromARGB(221, 1, 1, 1),
            weight: FontWeight.w600,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 5),
            child: Divider(
              thickness: 0.4,
              color: Colors.black26,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
                  controller: widget.digitalAddress,
                  hintext: 'Enter digital address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Digital Address',
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
                    deviceHeight: 48,
                    press: widget.verify,
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
          SizedBox(
            height: 0.015.sh,
          ),
          CustomTextField(
            controller: widget.houseNo,
            hintext: 'Enter House/Flat No./LMB',
            keyboardType: TextInputType.emailAddress,
            validator: (email) {
              if (email!.isEmpty) {
                return 'Please this field is empty';
              } else {
                return null;
              }
            },
            lable: 'House/Flat No./LMB',
            isForm: true,
          ),
          SizedBox(
            height: 0.015.sh,
          ),
          CustomTextField(
            controller: widget.streetName,
            hintext: 'eg. George Bush ST',
            keyboardType: TextInputType.emailAddress,
            validator: (email) {
              if (email!.isEmpty) {
                return 'Please this field is empty';
              } else {
                return null;
              }
            },
            lable: 'Street Name',
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
                selectedState = null;
                selectedCity = null;
                stateList = [];
                cityList = [];
                widget.country?.text = selectedCountry ?? '';
              });
              // Fetch states for the selected country
              final countries = await cState.getAllCountries();
              final country =
                  countries.firstWhere((c) => c.name == selectedCountry);
              fetchStates(country.isoCode);
            },
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          if (stateList.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Region',
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
                  hintText: 'Select Region',
                  items: stateList,
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
                          color:
                              Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                  ? Colors.grey
                                  : Colors.black54,
                          fontSize: 14),
                      closedBorderRadius: BorderRadius.circular(10)),
                  initialItem: selectedState,
                  onChanged: (value) async {
                    setState(() {
                      selectedState = value!;
                      selectedCity = null;
                      cityList = [];
                      widget.state?.text = selectedState ?? '';
                    });
                    // Fetch cities for the selected state
                    final countries = await cState.getAllCountries();
                    final states = await cState.getAllStates();
                    final country =
                        countries.firstWhere((c) => c.name == selectedCountry);
                    final state =
                        states.firstWhere((s) => s.name == selectedState);
                    fetchCities(country.isoCode, state.isoCode);
                  },
                ),
              ],
            ),
          SizedBox(
            height: 0.02.sh,
          ),
          if (cityList.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'City',
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
                  hintText: 'Select City',
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
                          color:
                              Provider.of<ThemeProvider>(context, listen: false).isDarkMode
                                  ? Colors.grey
                                  : Colors.black54,
                          fontSize: 14),
                      closedBorderRadius: BorderRadius.circular(10)),
                  items: cityList,
                  initialItem: selectedCity,
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value!;
                      widget.city.text = selectedCity ?? '';
                    });
                  },
                ),
                SizedBox(
                  height: 0.02.sh,
                ),
              ],
            ),
          SizedBox(
            height: 0.008.sh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                  color: theme.secondaryColor ?? Colors.white,
                  deviceWidth: 150,
                  deviceHeight: 40,
                  rad: 8,
                  size: 13,
                  press: widget.press,
                  title: 'Save Address'),
            ],
          )
        ],
      ),
    );
  }
}

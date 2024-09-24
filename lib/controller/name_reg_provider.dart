import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:orc_public/models/business_creation_model.dart';
import 'package:orc_public/models/sector_model.dart';
import 'package:orc_public/services/helpers/business_creation_helper.dart';

class NameRegProvider with ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;

  set loading(bool newState) {
    _loading = newState;
    notifyListeners();
  }

  bool _isicloading = true;
  bool get isicloading => _isicloading;

  set isicloading(bool newState) {
    _isicloading = newState;
    notifyListeners();
  }

  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();
  final thirdFormKey = GlobalKey<FormState>();
  final fourthFormKey = GlobalKey<FormState>();
  int _currentPage = 0;

  bool validateAndSave() {
    final form = firstFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  // Define TextEditingControllers
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessTINController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController ghanaCardController = TextEditingController();

  // Office Address Controllers
  TextEditingController officeDigitalAddressController =
      TextEditingController();
  TextEditingController officeHouseNoController = TextEditingController();
  TextEditingController officeStreetNameController = TextEditingController();
  TextEditingController officeCityController = TextEditingController();

  // Propp Address Controllers
  TextEditingController propDigitalAddressController = TextEditingController();
  TextEditingController propHouseNoController = TextEditingController();
  TextEditingController propStreetNameController = TextEditingController();
  TextEditingController propCityController = TextEditingController();
  TextEditingController propStateController = TextEditingController();
  TextEditingController propCountryController = TextEditingController();

  // Propp Info Controllers
  TextEditingController propGhaaCardController = TextEditingController();
  TextEditingController proptitleController = TextEditingController();
  TextEditingController propGenderController = TextEditingController();
  TextEditingController propfirstNameontroller = TextEditingController();
  TextEditingController proplastNameController = TextEditingController();
  TextEditingController propOccupationController = TextEditingController();
  TextEditingController propTINController = TextEditingController();
  TextEditingController propCountry2Controller = TextEditingController();

  // Place of Business Controllers
  TextEditingController businessDigitalAddressController =
      TextEditingController();
  TextEditingController businessHouseNoController = TextEditingController();
  TextEditingController businessStreetNameController = TextEditingController();
  TextEditingController businessCityController = TextEditingController();

  // Other Places Controllers
  TextEditingController otherDigitalAddressController = TextEditingController();
  TextEditingController otherHouseNoController = TextEditingController();
  TextEditingController otherStreetNameController = TextEditingController();
  TextEditingController otherCityController = TextEditingController();

//contact details
  TextEditingController phoneOneController = TextEditingController();
  final TextEditingController phoneTwoController = TextEditingController();
  final TextEditingController mobileOneController = TextEditingController();
  final TextEditingController mobileTwoController = TextEditingController();
  final TextEditingController faxController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  final TextEditingController landLordNameController = TextEditingController();

// MSME & BOP
  TextEditingController revEnvisagedController = TextEditingController();
  TextEditingController employeeNumberController = TextEditingController();
  TextEditingController bopRefController = TextEditingController();
  // Clean up controllers when the provider is disposed
  @override
  void dispose() {
    setPage(0);
    businessNameController.clear();
    officeDigitalAddressController.clear();
    officeHouseNoController.clear();
    officeStreetNameController.clear();
    officeCityController.clear();

    businessDigitalAddressController.clear();
    businessHouseNoController.clear();
    businessStreetNameController.clear();
    businessCityController.clear();

    otherDigitalAddressController.clear();
    otherHouseNoController.clear();
    otherStreetNameController.clear();
    otherCityController.clear();

    propGhaaCardController.clear();
    proptitleController.clear();
    propGenderController.clear();
    propfirstNameontroller.clear();
    proplastNameController.clear();
    propOccupationController.clear();
    propTINController.clear();
    propCountry2Controller.clear();

    phoneOneController.clear();
    phoneTwoController.clear();
    mobileOneController.clear();
    mobileTwoController.clear();
    faxController.clear();
    emailController.clear();
    websiteController.clear();

    firstNameController.clear();
    lastNameController.clear();
    occupationController.clear();
    super.dispose();
  }

  final List<String> _pageTitles = [
    'Business Details',
    'Business Address',
    'Contact Details',
    'Proprietor/Proprietress Details',
    'Proprietor/Proprietress Address',
    'MSME and BOP Details',
    'Review'
    // Add more titles as per your page count
  ];

  List<String> get pageTitles => _pageTitles;

  List<SectorModel> _options = [];
  List<String> _selectedOptions = [];

  List<SectorModel> get options => _options;
  List<String> get selectedOptions => _selectedOptions;

  int get currentPage => _currentPage;
  String get currentPageTitle => _pageTitles[_currentPage];

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  List<SectorModel> _isics = [];
  List<String> _selectedIsics = [];

  List<SectorModel> get isics => _isics;
  List<String> get selectedIsics => _selectedIsics;

  set selectedIsics(List<String> value) {
    _selectedIsics = value;
    notifyListeners();
  }

  set selectedOptions(List<String> value) {
    _selectedOptions = value;
    notifyListeners();
  }

  void fetchSectors() async {
    _options = await BusinessCreationHelper.getBusinessSectors();
    loading = false;
  }

  void fetchIsics() async {
    _isics = await BusinessCreationHelper.getBusinessIsicsCodes();
    isicloading = false;
  }
}

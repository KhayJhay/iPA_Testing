import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/models/address_model.dart';
import 'package:orc_public/services/helpers/business_creation_helper.dart';
import 'package:orc_public/utils/constants/constants.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/multi_choice_chiips.dart';
import 'package:orc_public/view/feature/dashboard/pages/name_registration/components/addressComponent.dart';
import 'package:provider/provider.dart';

import '../../../../../../controller/name_reg_provider.dart';
import '../../../../../../utils/widgets/authWedget.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Overview',
              fontSize: 18,
              textColor: Colors.black87,
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 0.008.sh,
            ),
            AppText(
              text: 'Review all field details in this application',
              fontSize: 12,
              textColor: Colors.black87,
              weight: FontWeight.w300,
              textAlign: TextAlign.left,
              textOverflow: TextOverflow.visible,
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewTitle(
                  title: 'Business Details',
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.businessNameController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Company Name',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.dateController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Commencement Date',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                nameRegNotifier.selectedIsics.isEmpty
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 0.015.sh,
                      ),
                nameRegNotifier.selectedIsics.isEmpty
                    ? SizedBox.shrink()
                    : AppText(
                        text: 'Principal Business Activities (ISIC codes)',
                        textAlign: TextAlign.center,
                        fontSize: 13,
                        textOverflow: TextOverflow.visible,
                        weight: FontWeight.w400,
                        textColor: Colors.black87,
                      ),
                nameRegNotifier.selectedIsics.isEmpty
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 8,
                      ),
                Wrap(
                  spacing: 10,
                  children: nameRegNotifier.selectedIsics.map((isics) {
                    return FilterChip(
                        selected: true,
                        selectedColor: Colors.grey.shade400,
                        label: AppText(
                          text: isics,
                          textAlign: TextAlign.center,
                          fontSize: 13,
                          textOverflow: TextOverflow.visible,
                          weight: FontWeight.w400,
                          textColor: Colors.black87,
                        ),
                        onSelected: (bool value) {});
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewTitle(
                  title: 'Registered Office Address',
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller:
                            nameRegNotifier.officeDigitalAddressController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Digital Address',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.officeHouseNoController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'House/Flat No. /LMB',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.officeStreetNameController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Street Name',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.officeCityController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'City',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.officeStreetNameController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Region',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.officeCityController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'District',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                CustomTextField(
                  controller: nameRegNotifier.countryController,
                  hintext: '-',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Country',
                  isEnabled: false,
                  isForm: true,
                ),
              ],
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewTitle(
                  title: 'Business Contact Details',
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.phoneOneController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Phone Number One',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.phoneTwoController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Phone Number Two',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.mobileOneController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Mobile Number One',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.mobileTwoController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Mobile Number Two',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.faxController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Fax',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.emailController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Email',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 0.015.sh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewTitle(
                  title: 'Proprietor/Proprietress Details',
                ),
                CustomTextField(
                  controller: nameRegNotifier.propGhaaCardController,
                  hintext: '-',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Ghana Card',
                  isEnabled: false,
                  isForm: true,
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.proptitleController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Title',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propGenderController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Gender',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.firstNameController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'First Name',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.proplastNameController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Last Name',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propCountry2Controller,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Nationality',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propOccupationController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Occupation',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewTitle(
                  title: 'Proprietor/Proprietress Contact Details',
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.phoneOneController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Phone Number One',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.phoneTwoController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Phone Number Two',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.mobileOneController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Mobile Number One',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.mobileTwoController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Mobile Number Two',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.faxController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Fax',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.emailController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Email',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewTitle(
                  title: 'Proprietor/Proprietress Address Details',
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller:
                            nameRegNotifier.propDigitalAddressController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Digital Address',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propHouseNoController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'House/Flat No. /LMB',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propStreetNameController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Street Name',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propCityController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'City',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propStateController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Region',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: nameRegNotifier.propCountryController,
                        hintext: '-',
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please this field is empty';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Country',
                        isEnabled: false,
                        isForm: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewTitle(
                  title: 'MSME / BOP Details',
                ),
                CustomTextField(
                  controller: nameRegNotifier.revEnvisagedController,
                  hintext: '-',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'Revenue Envisaged',
                  isEnabled: false,
                  isForm: true,
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                CustomTextField(
                  controller: nameRegNotifier.employeeNumberController,
                  hintext: '-',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'No. of Employees Envisaged',
                  isEnabled: false,
                  isForm: true,
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                CustomTextField(
                  controller: nameRegNotifier.bopRefController,
                  hintext: '-',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please this field is empty';
                    } else {
                      return null;
                    }
                  },
                  lable: 'BOP Reference Number',
                  isEnabled: false,
                  isForm: true,
                ),
              ],
            ),
            SizedBox(
              height: 0.1.sh,
            )
          ],
        ),
      ),
    );
  }
}

class ReviewTitle extends StatelessWidget {
  String title;
  ReviewTitle({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
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
      ],
    );
  }
}

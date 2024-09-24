import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/utils/widgets/app_text.dart';
import 'package:orc_public/utils/widgets/multiSelect_dropdown.dart';
import 'package:orc_public/utils/widgets/multi_choice_chiips.dart';
import 'package:provider/provider.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import '../../../../../../controller/name_reg_provider.dart';
import '../../../../../../utils/widgets/authWedget.dart';
import 'package:intl/intl.dart';

class BusinessDetailsForm extends StatefulWidget {
  String? bussName;
  BusinessDetailsForm({super.key, this.bussName});

  @override
  State<BusinessDetailsForm> createState() => _BusinessDetailsFormState();
}

class _BusinessDetailsFormState extends State<BusinessDetailsForm> {
  final TextEditingController emailController = TextEditingController();
  DateTime? selectedDate;
  @override
  void initState() {
    // TODO: implement initState
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);
    nameRegNotifier.businessNameController.text = widget.bussName ?? '';
    super.initState();
    nameRegNotifier.fetchSectors();
  }

  @override
  Widget build(BuildContext context) {
    var nameRegNotifier = Provider.of<NameRegProvider>(context, listen: false);

    void datePicker() async {
      final date = await showDatePickerDialog(
        context: context,
        initialDate: DateTime.now(),
        maxDate: DateTime.now().add(const Duration(days: 365 * 3)),
        minDate: DateTime.now().subtract(const Duration(days: 365 * 3)),
      );
      if (date != null) {
        setState(() {
          selectedDate = date;
          nameRegNotifier.dateController.text =
              DateFormat('dd/MM/yyyy').format(selectedDate!);
        });
      }
    }

    return SingleChildScrollView(
      child: Form(
        key: nameRegNotifier.firstFormKey,
        child: FadeInUp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Business Details',
                fontSize: 18,
                textColor: Colors.black87,
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 0.008.sh,
              ),
              AppText(
                text:
                    'Fill in all details regarding the business you want to register',
                fontSize: 12,
                textColor: Colors.black87,
                weight: FontWeight.w300,
                textAlign: TextAlign.left,
                textOverflow: TextOverflow.visible,
              ),
              SizedBox(
                height: 0.015.sh,
              ),
              CustomTextField(
                controller: nameRegNotifier.businessNameController,
                hintext: 'eg.ABC Ventures',
                keyboardType: TextInputType.emailAddress,
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'Please enter a valid name';
                  } else {
                    return null;
                  }
                },
                lable: 'Business Name',
                isForm: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    text: 'Use reserved names?',
                    fontSize: 12,
                    textColor: Theme.of(context).colorScheme.tertiary,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    textOverflow: TextOverflow.visible,
                  ),
                ],
              ),
              MultiSelectDrop(),
              SizedBox(
                height: 0.015.sh,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Date of Commencement',
                    textAlign: TextAlign.center,
                    fontSize: 13,
                    textOverflow: TextOverflow.visible,
                    weight: FontWeight.w400,
                    textColor: Colors.black87,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () => datePicker(),
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: selectedDate == null
                                ? 'Select date of commencement'
                                : '${DateFormat('dd/MM/yyyy').format(selectedDate!)}',
                            textColor: selectedDate == null
                                ? Colors.grey.shade400
                                : Colors.black,
                            fontSize: 14,
                            weight: FontWeight.w400,
                          ),
                          Icon(
                            IconlyLight.calendar,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

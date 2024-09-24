import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:orc_public/models/action_model.dart';
import 'package:orc_public/models/trannsaction_model.dart';

import '../../models/business_name_model.dart';
import '../../models/registration_type.dart';
import '../../theme/apptheme.dart';

AppTheme theme = LightTheme();

const primaryColor = Color(0xFF282565);
const darkColor = Color(0xFF000000);
const secondaryColor = Color(0xFF09AB98);
const redColor = Color(0xFFFF4500);
const bgColor = Color(0xFFF3F4F6);
const cardColor = Colors.white;

List<String> searchCriteriaList = [
  'Starts WIth',
  'Contains',
  'Sounds Like',
];

String selectedCriteria = 'Starts WIth';

bool isNotfound = false;
bool isresLoading = false;
bool isfound = false;

String _searchText = '';
List<String> strings = [
  "Mary's Fashion",
  'TesMa Multimedia',
  'Bee Bakery',
  'TesMema Group',
  'PBlessing Automobiles',
];

final myEntities = [
  BusinessName(
    name: "Mary's Fashion",
    description: "Sole Proprietorship",
  ),
  BusinessName(
    name: "TesMa Multimedia",
    description: "Company Limited by Shares",
  ),
  BusinessName(
    name: "Bee Bakery",
    description: "Public Company Unlimited by Shares",
  ),
  BusinessName(
    name: "TesMema Group",
    description: "Sole Proprietorship",
  ),
  BusinessName(
    name: "PBlessing Automobiles",
    description: "Partnerships",
  ),
];

final businessNames = [
  BusinessName(
    name: "Registration of Business Names",
    description:
        "Business Names also known as a sole proprietorship (one-man business)",
  ),
  BusinessName(
    name: "Registration of Professional Bodies",
    description:
        "Organizations regulating a specific profession and setting standards for its members.",
  ),
  BusinessName(
    name: "Corporate Business Names",
    description:
        "Names used by a company that is controlled by another company (parent company).",
  ),
  BusinessName(
    name: "Company Limited by Shares",
    description: "A company with limited liability for its shareholders.",
  ),
  BusinessName(
    name: "Public Company Unlimited by Shares",
    description:
        "A public company where shareholders have unlimited liability for the company's debts.",
  ),
  BusinessName(
    name: "Public Company Limited by Shares",
    description:
        "A public company with limited liability for its shareholders.",
  ),
  BusinessName(
    name: "Private Company Limited by Guarantee",
    description:
        "A private company where liability is limited by guarantee provided by its members.",
  ),
  BusinessName(
    name: "Partnerships",
    description:
        "A business structure where two or more people share ownership and profits.",
  ),
  BusinessName(
    name: "External Company",
    description:
        "A company registered outside the jurisdiction where it operates.",
  ),
  BusinessName(
    name: "Private Company Unlimited by Shares",
    description:
        "A private company where shareholders have unlimited liability for the company's debts.",
  ),
  BusinessName(
    name: "Public Company Limited by Guarantee",
    description:
        "A public company where liability is limited by guarantee provided by its members.",
  ),
];

final entityActions = [
  ActionModel(
      name: "Entity Details",
      description: "View entity information",
      icons: IconlyLight.show),
  ActionModel(
      name: "Change in particulars",
      description: "Make changes to particulars of current entity",
      icons: IconlyLight.document),
  ActionModel(
      name: "Change Beneficial Owner",
      description: "Make changes to beneficial owner of current entity",
      icons: IconlyLight.user_1),
  ActionModel(
      name: "Filing",
      description: "File for annual returns to current entity",
      icons: IconlyLight.edit_square),
  ActionModel(
      name: "Company Profile",
      description: "View Current Company Profile",
      icons: IconlyLight.user_1),
  ActionModel(
      name: "Annual Renewal",
      description: "Renew Business Name Registration",
      icons: IconlyLight.time_circle),
  ActionModel(
      name: "Transactions",
      description: "View Transactions of current entity",
      icons: IconlyLight.swap),
  ActionModel(
      name: "Print Document",
      description: "Certificates, Forms, etc",
      icons: Icons.print_rounded),
  ActionModel(
      name: "Cancel Registration",
      description: "Terminate the Registration Process",
      icons: IconlyLight.close_square),
  ActionModel(
      name: "Restoration",
      description: "Restoration of the name of business  or firm",
      icons: IconlyLight.time_circle),
  ActionModel(
      name: "Close Down",
      description: "Close down of a business",
      icons: IconlyLight.close_square),
];

List<ActionModel> filteredActions = [];

final FocusNode _focusNode = FocusNode();
bool _isFocused = false;

var businessNameRegistration = RegistrationType(
    title: 'Registration of Business Names',
    description:
        'Business Names also known as a sole proprietorship (one-man business) registered by one (1) person who takes all business decisions and all liabilities are unlimited i.e. makes profits alone and bears losses alone',
    procedures: [
      Procedure(
          number: '1',
          title: 'Check name availability',
          description: 'Ensure the business name is not already taken.'),
      Procedure(
          number: '2',
          title: 'Submit completed and signed Form A ',
          description: 'Complete all required fields.'),
      Procedure(
          number: '3',
          title: 'Pay processing fee of GHS 100',
          description: 'Complete all required fields.'),
      Procedure(
          number: '4',
          title: 'VIP service cost of GHs 400 in addition',
          description: 'Complete all required fields.'),
      Procedure(
          number: '5',
          title: 'Registrar Examines, Approves and Issues',
          description: 'Complete all required fields.'),
      Procedure(
          number: '6',
          title: 'Mandatory renewal of registered name each year ',
          description: 'Complete all required fields.'),
    ],
    pricing: [
      Pricing(
          title: 'Processing Fee',
          subTitle: 'Initial Payment(Mandatory)',
          price: 'GHS 300'),
      Pricing(
          title: 'VIP Fee',
          subTitle: 'Additional Payment(Optional)',
          price: 'GHS 400'),
    ],
    videoID: 'atq2ke_xT6Y',
    documentsRequired: [
      "Ecowas Card",
      "Company TIN",
      "Postal Address",
    ],
    documentsDescription: [
      "Do you have your GhanaCard available?",
      "Is your company TIN number available",
      "Check your postal address from GhanaPost Site",
    ]);

var professionalBodiessRegistration = RegistrationType(
    title: 'Registration of Professional Bodies',
    description:
        'BA Professional Body is a body corporate made up of professionals that are trained and qualified in a recognized profession and are united in a common interest  for the purposes of pursuing research and any other activities concerned with the progress of knowledge in that profession and for maintaining and advancing a code of ethics and conduct amongst its members.',
    procedures: [
      Procedure(
          number: '1',
          title: 'Check for the availability of the name to be registered',
          description: 'Ensure the business name is not already taken.'),
      Procedure(
          number: '2',
          title:
              'Applicant may purchase Professional Bodies Form(Form A) from the in-house bank or download online',
          description: 'Complete all required fields.'),
      Procedure(
          number: '3',
          title:
              'Provide a consent letter from a qualified  and licensed charted accountant with the Institute of Chartered Accountants Ghana ',
          description: 'Complete all required fields.'),
      Procedure(
          number: '4',
          title:
              'Submit Completed and signed forms at the Company Registration Counter for Verification and Capturing or submit application Online',
          description: 'Complete all required fields.'),
      Procedure(
          number: '5',
          title:
              'Attach the  constitution and list of members as at the date of application together with their qualifications and addresses',
          description: 'Complete all required fields.'),
    ],
    pricing: [
      Pricing(
          title: 'Filing Fee',
          subTitle: 'Initial Payment(Mandatory)',
          price: 'GHS 1380'),
      Pricing(
          title: 'VIP Fee',
          subTitle: 'Additional Payment(Optional)',
          price: 'GHS 1000'),
      Pricing(
          title: 'Annual Returns',
          subTitle: 'Additional Payment(Optional)',
          price: 'GHS 610'),
      Pricing(
          title: 'Annual Renewal',
          subTitle: 'Additional Payment(Optional)',
          price: 'GHS 30'),
    ],
    videoID: 'atq2ke_xT6Y',
    documentsRequired: [
      "Ecowas Card",
      "Company TIN",
      "Postal Address",
    ],
    documentsDescription: [
      "Do you have your GhanaCard available?",
      "Is your company TIN number available",
      "Check your postal address from GhanaPost Site",
    ]);

var transactions = [
  TransactionModel(
      transactionType: 'Change In Particulars',
      transactionId: 'TRX0002123456',
      entityName: 'Mary Janes S Fashion Home',
      entityType: 'Business Name Registration',
      updatedAt: '19 June 2024 | 6:00 pm',
      updatedBy: 'admin@example.com',
      status: 'Approved'),
  TransactionModel(
      transactionType: 'Change In Particulars',
      transactionId: 'TRX0002123456',
      entityName: 'Mary Janes S Fashion Home',
      entityType: 'Business Name Registration',
      updatedAt: '19 June 2024 | 6:00 pm',
      updatedBy: 'admin@example.com',
      status: 'Approved'),
  TransactionModel(
      transactionType: 'Renewal',
      transactionId: 'TRX0002123457',
      entityName: 'Kofi Broke Ltd',
      entityType: 'Limited Liability Company',
      updatedAt: '20 June 2024 | 10:00 am',
      updatedBy: 'user@example.com',
      status: 'Pending'),
  TransactionModel(
      transactionType: 'Annual Returns Filing',
      transactionId: 'TRX0002123458',
      entityName: 'Ama Enterprise',
      entityType: 'Sole Proprietorship',
      updatedAt: '21 June 2024 | 2:00 pm',
      updatedBy: 'admin@example.com',
      status: 'Rejected'),
  TransactionModel(
      transactionType: 'Change In Particulars',
      transactionId: 'TRX0002123459',
      entityName: 'John Doe Ventures',
      entityType: 'Business Name Registration',
      updatedAt: '22 June 2024 | 11:00 am',
      updatedBy: 'user@example.com',
      status: 'Approved'),
  TransactionModel(
      transactionType: 'Business Registration Renewal',
      transactionId: 'TRX0002123460',
      entityName: 'Emmanuel Ventures',
      entityType: 'Partnership',
      updatedAt: '23 June 2024 | 3:00 pm',
      updatedBy: 'admin@example.com',
      status: 'Pending'),
];

String selectedDoc = 'Certificate of Incorporation';

List<String> printDocs = [
  "Certificate of Incorporation",
  "Form B",
  "Form B1",
  "Company Profile",
  "Change Profile",
  "Beneficial Ownership - Change Profile",
  "Special Resolution / Annual Renewal / Annual Return Form",
  "Individual TIN Certificate",
  "Form 9",
  "Form 9A",
  "Form 9B",
  "Form 11",
  "Form 11A",
  "Form 10",
  "Form 10A",
];

String selectedTrans = 'Change In Particulars';

List<String> printTrans = [
  "Annual Returns Filing",
  "Change In Particulars",
  "Renewal",
];

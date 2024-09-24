// To parse this JSON data, do
//
//     final dummyUserModel = dummyUserModelFromJson(jsonString);

import 'dart:convert';

DummyUserModel dummyUserModelFromJson(String str) =>
    DummyUserModel.fromJson(json.decode(str));

String dummyUserModelToJson(DummyUserModel data) => json.encode(data.toJson());

class DummyUserModel {
  final String? id;
  final String? userType;
  final UserDetails? userDetails;
  final List<ReservedName>? reservedNames;
  final List<dynamic>? queries;
  final List<dynamic>? applications;
  final List<Entity>? entities;

  DummyUserModel({
    this.id,
    this.userType,
    this.userDetails,
    this.reservedNames,
    this.queries,
    this.applications,
    this.entities,
  });

  factory DummyUserModel.fromJson(Map<String, dynamic> json) => DummyUserModel(
        id: json["id"],
        userType: json["userType"],
        userDetails: json["userDetails"] == null
            ? null
            : UserDetails.fromJson(json["userDetails"]),
        reservedNames: json["reservedNames"] == null
            ? []
            : List<ReservedName>.from(
                json["reservedNames"]!.map((x) => ReservedName.fromJson(x))),
        queries: json["queries"] == null
            ? []
            : List<dynamic>.from(json["queries"]!.map((x) => x)),
        applications: json["applications"] == null
            ? []
            : List<dynamic>.from(json["applications"]!.map((x) => x)),
        entities: json["entities"] == null
            ? []
            : List<Entity>.from(
                json["entities"]!.map((x) => Entity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userType": userType,
        "userDetails": userDetails?.toJson(),
        "reservedNames": reservedNames == null
            ? []
            : List<dynamic>.from(reservedNames!.map((x) => x.toJson())),
        "queries":
            queries == null ? [] : List<dynamic>.from(queries!.map((x) => x)),
        "applications": applications == null
            ? []
            : List<dynamic>.from(applications!.map((x) => x)),
        "entities": entities == null
            ? []
            : List<dynamic>.from(entities!.map((x) => x.toJson())),
      };
}

class Entity {
  final String? companyType;
  final CompanyDetails? companyDetails;
  final Ess? registeredOfficeAddress;
  final bool? sameAsRegisteredAddress;
  final bool? hasOtherPlaceOfBussiness;
  final bool? sameRegisteredMemberAddress;
  final Ess? principalPlaceOfBusiness;
  final List<Ess>? otherPlaceOfBusiness;
  final PostalAddress? postalAddress;
  final CompanyContact? companyContact;
  final ProprietorDetails? proprietorDetails;
  final Ess? proprietorAddress;
  final MsmeDetails? msmeDetails;
  final Ess? officeAddress;
  final Ess? registerOfMembersAddress;
  final List<Director>? directors;
  final String? secretaryType;
  final IndividualSecretary? individualSecretary;
  final CorportateSecretary? corportateSecretary;
  final Attestation? attestation;
  final Auditor? auditor;
  final SharesAndCapital? sharesAndCapital;
  final List<IndividualSecretary>? subscribers;
  final List<IndividualSecretary>? beneficialOwners;
  final RegulatoryRequirements? regulatoryRequirements;
  final ParticularsOfChargesOnPartnershipAssets?
      particularsOfChargesOnPartnershipAssets;

  Entity({
    this.companyType,
    this.companyDetails,
    this.registeredOfficeAddress,
    this.sameAsRegisteredAddress,
    this.hasOtherPlaceOfBussiness,
    this.sameRegisteredMemberAddress,
    this.principalPlaceOfBusiness,
    this.otherPlaceOfBusiness,
    this.postalAddress,
    this.companyContact,
    this.proprietorDetails,
    this.proprietorAddress,
    this.msmeDetails,
    this.officeAddress,
    this.registerOfMembersAddress,
    this.directors,
    this.secretaryType,
    this.individualSecretary,
    this.corportateSecretary,
    this.attestation,
    this.auditor,
    this.sharesAndCapital,
    this.subscribers,
    this.beneficialOwners,
    this.regulatoryRequirements,
    this.particularsOfChargesOnPartnershipAssets,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        companyType: json["companyType"],
        companyDetails: json["companyDetails"] == null
            ? null
            : CompanyDetails.fromJson(json["companyDetails"]),
        registeredOfficeAddress: json["registeredOfficeAddress"] == null
            ? null
            : Ess.fromJson(json["registeredOfficeAddress"]),
        sameAsRegisteredAddress: json["sameAsRegisteredAddress"],
        hasOtherPlaceOfBussiness: json["hasOtherPlaceOfBussiness"],
        sameRegisteredMemberAddress: json["sameRegisteredMemberAddress"],
        principalPlaceOfBusiness: json["principalPlaceOfBusiness"] == null
            ? null
            : Ess.fromJson(json["principalPlaceOfBusiness"]),
        otherPlaceOfBusiness: json["otherPlaceOfBusiness"] == null
            ? []
            : List<Ess>.from(
                json["otherPlaceOfBusiness"]!.map((x) => Ess.fromJson(x))),
        postalAddress: json["postalAddress"] == null
            ? null
            : PostalAddress.fromJson(json["postalAddress"]),
        companyContact: json["companyContact"] == null
            ? null
            : CompanyContact.fromJson(json["companyContact"]),
        proprietorDetails: json["proprietorDetails"] == null
            ? null
            : ProprietorDetails.fromJson(json["proprietorDetails"]),
        proprietorAddress: json["proprietorAddress"] == null
            ? null
            : Ess.fromJson(json["proprietorAddress"]),
        msmeDetails: json["msmeDetails"] == null
            ? null
            : MsmeDetails.fromJson(json["msmeDetails"]),
        officeAddress: json["officeAddress"] == null
            ? null
            : Ess.fromJson(json["officeAddress"]),
        registerOfMembersAddress: json["registerOfMembersAddress"] == null
            ? null
            : Ess.fromJson(json["registerOfMembersAddress"]),
        directors: json["directors"] == null
            ? []
            : List<Director>.from(
                json["directors"]!.map((x) => Director.fromJson(x))),
        secretaryType: json["secretaryType"],
        individualSecretary: json["individualSecretary"] == null
            ? null
            : IndividualSecretary.fromJson(json["individualSecretary"]),
        corportateSecretary: json["corportateSecretary"] == null
            ? null
            : CorportateSecretary.fromJson(json["corportateSecretary"]),
        attestation: json["attestation"] == null
            ? null
            : Attestation.fromJson(json["attestation"]),
        auditor:
            json["auditor"] == null ? null : Auditor.fromJson(json["auditor"]),
        sharesAndCapital: json["sharesAndCapital"] == null
            ? null
            : SharesAndCapital.fromJson(json["sharesAndCapital"]),
        subscribers: json["subscribers"] == null
            ? []
            : List<IndividualSecretary>.from(json["subscribers"]!
                .map((x) => IndividualSecretary.fromJson(x))),
        beneficialOwners: json["beneficialOwners"] == null
            ? []
            : List<IndividualSecretary>.from(json["beneficialOwners"]!
                .map((x) => IndividualSecretary.fromJson(x))),
        regulatoryRequirements: json["regulatoryRequirements"] == null
            ? null
            : RegulatoryRequirements.fromJson(json["regulatoryRequirements"]),
        particularsOfChargesOnPartnershipAssets:
            json["particularsOfChargesOnPartnershipAssets"] == null
                ? null
                : ParticularsOfChargesOnPartnershipAssets.fromJson(
                    json["particularsOfChargesOnPartnershipAssets"]),
      );

  Map<String, dynamic> toJson() => {
        "companyType": companyType,
        "companyDetails": companyDetails?.toJson(),
        "registeredOfficeAddress": registeredOfficeAddress?.toJson(),
        "sameAsRegisteredAddress": sameAsRegisteredAddress,
        "hasOtherPlaceOfBussiness": hasOtherPlaceOfBussiness,
        "sameRegisteredMemberAddress": sameRegisteredMemberAddress,
        "principalPlaceOfBusiness": principalPlaceOfBusiness?.toJson(),
        "otherPlaceOfBusiness": otherPlaceOfBusiness == null
            ? []
            : List<dynamic>.from(otherPlaceOfBusiness!.map((x) => x.toJson())),
        "postalAddress": postalAddress?.toJson(),
        "companyContact": companyContact?.toJson(),
        "proprietorDetails": proprietorDetails?.toJson(),
        "proprietorAddress": proprietorAddress?.toJson(),
        "msmeDetails": msmeDetails?.toJson(),
        "officeAddress": officeAddress?.toJson(),
        "registerOfMembersAddress": registerOfMembersAddress?.toJson(),
        "directors": directors == null
            ? []
            : List<dynamic>.from(directors!.map((x) => x.toJson())),
        "secretaryType": secretaryType,
        "individualSecretary": individualSecretary?.toJson(),
        "corportateSecretary": corportateSecretary?.toJson(),
        "attestation": attestation?.toJson(),
        "auditor": auditor?.toJson(),
        "sharesAndCapital": sharesAndCapital?.toJson(),
        "subscribers": subscribers == null
            ? []
            : List<dynamic>.from(subscribers!.map((x) => x.toJson())),
        "beneficialOwners": beneficialOwners == null
            ? []
            : List<dynamic>.from(beneficialOwners!.map((x) => x.toJson())),
        "regulatoryRequirements": regulatoryRequirements?.toJson(),
        "particularsOfChargesOnPartnershipAssets":
            particularsOfChargesOnPartnershipAssets?.toJson(),
      };
}

class Attestation {
  final String? role;
  final String? name;
  final String? email;

  Attestation({
    this.role,
    this.name,
    this.email,
  });

  factory Attestation.fromJson(Map<String, dynamic> json) => Attestation(
        role: json["role"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "name": name,
        "email": email,
      };
}

class Auditor {
  final String? name;
  final String? tin;
  final String? digitalAddress;
  final String? firmAddress;
  final String? streetName;
  final String? city;
  final String? district;
  final Region? region;
  final String? licenceNumber;

  Auditor({
    this.name,
    this.tin,
    this.digitalAddress,
    this.firmAddress,
    this.streetName,
    this.city,
    this.district,
    this.region,
    this.licenceNumber,
  });

  factory Auditor.fromJson(Map<String, dynamic> json) => Auditor(
        name: json["name"],
        tin: json["tin"],
        digitalAddress: json["digitalAddress"],
        firmAddress: json["firmAddress"],
        streetName: json["streetName"],
        city: json["city"],
        district: json["district"],
        region: regionValues.map[json["region"]]!,
        licenceNumber: json["licenceNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "tin": tin,
        "digitalAddress": digitalAddress,
        "firmAddress": firmAddress,
        "streetName": streetName,
        "city": city,
        "district": district,
        "region": regionValues.reverse[region],
        "licenceNumber": licenceNumber,
      };
}

enum Region { GREATER_ACCRA, NEW_YORK }

final regionValues = EnumValues(
    {"Greater Accra": Region.GREATER_ACCRA, "New York": Region.NEW_YORK});

class IndividualSecretary {
  final BoType? boType;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? subscriberType;

  IndividualSecretary({
    this.boType,
    this.name,
    this.email,
    this.phoneNumber,
    this.subscriberType,
  });

  factory IndividualSecretary.fromJson(Map<String, dynamic> json) {
    try {
      return IndividualSecretary(
        boType: boTypeValues.map[json["boType"]],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        subscriberType: json["subscriberType"],
      );
    } catch (e) {
      // Log the error and the problematic JSON
      print("Error parsing IndividualSecretary: $e");
      print("JSON: $json");
      return IndividualSecretary(); // Return a default or empty instance
    }
  }

  Map<String, dynamic> toJson() => {
        "boType": boTypeValues.reverse[boType],
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "subscriberType": subscriberType,
      };
}

enum BoType { LISTED_COMPANY, NATURAL_PERSON }

final boTypeValues = EnumValues({
  "Listed Company": BoType.LISTED_COMPANY,
  "Natural Person": BoType.NATURAL_PERSON
});

class CompanyContact {
  final String? phoneNumber1;
  final String? phoneNumber2;
  final String? mobileNumber1;
  final String? mobileNumber2;
  final String? fax;
  final String? emailAddress;
  final String? website;

  CompanyContact({
    this.phoneNumber1,
    this.phoneNumber2,
    this.mobileNumber1,
    this.mobileNumber2,
    this.fax,
    this.emailAddress,
    this.website,
  });

  factory CompanyContact.fromJson(Map<String, dynamic> json) => CompanyContact(
        phoneNumber1: json["phoneNumber_1"],
        phoneNumber2: json["phoneNumber_2"],
        mobileNumber1: json["mobileNumber_1"],
        mobileNumber2: json["mobileNumber_2"],
        fax: json["fax"],
        emailAddress: json["emailAddress"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber_1": phoneNumber1,
        "phoneNumber_2": phoneNumber2,
        "mobileNumber_1": mobileNumber1,
        "mobileNumber_2": mobileNumber2,
        "fax": fax,
        "emailAddress": emailAddress,
        "website": website,
      };
}

class CompanyDetails {
  final String? companyName;
  final List<String>? sectors;
  final List<IsicCode>? isicCodes;
  final String? natureOfBusiness;
  final DateTime? dateOfCommencement;
  final String? constitution;
  final dynamic constitutionFile;
  final String? name;
  final String? endingWith;
  final List<IsicCode>? isicCode;
  final String? parentcompanyName;
  final String? registrationNumberOfParentCompany;
  final String? partnershipName;
  final List<IndividualSecretary>? partners;
  final String? tin;

  CompanyDetails({
    this.companyName,
    this.sectors,
    this.isicCodes,
    this.natureOfBusiness,
    this.dateOfCommencement,
    this.constitution,
    this.constitutionFile,
    this.name,
    this.endingWith,
    this.isicCode,
    this.parentcompanyName,
    this.registrationNumberOfParentCompany,
    this.partnershipName,
    this.partners,
    this.tin,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) => CompanyDetails(
        companyName: json["companyName"],
        sectors: json["sectors"] == null
            ? []
            : List<String>.from(json["sectors"]!.map((x) => x)),
        isicCodes: json["isicCodes"] == null
            ? []
            : List<IsicCode>.from(
                json["isicCodes"]!.map((x) => IsicCode.fromJson(x))),
        natureOfBusiness: json["natureOfBusiness"],
        dateOfCommencement: json["dateOfCommencement"] == null
            ? null
            : DateTime.parse(json["dateOfCommencement"]),
        constitution: json["constitution"],
        constitutionFile: json["constitutionFile"],
        name: json["name"],
        endingWith: json["endingWith"],
        isicCode: json["isicCode"] == null
            ? []
            : List<IsicCode>.from(
                json["isicCode"]!.map((x) => IsicCode.fromJson(x))),
        parentcompanyName: json["parentcompanyName"],
        registrationNumberOfParentCompany:
            json["registrationNumberOfParentCompany"],
        partnershipName: json["partnershipName"],
        partners: json["partners"] == null
            ? []
            : List<IndividualSecretary>.from(
                json["partners"]!.map((x) => IndividualSecretary.fromJson(x))),
        tin: json["tin"],
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "sectors":
            sectors == null ? [] : List<dynamic>.from(sectors!.map((x) => x)),
        "isicCodes": isicCodes == null
            ? []
            : List<dynamic>.from(isicCodes!.map((x) => x.toJson())),
        "natureOfBusiness": natureOfBusiness,
        "dateOfCommencement":
            "${dateOfCommencement!.year.toString().padLeft(4, '0')}-${dateOfCommencement!.month.toString().padLeft(2, '0')}-${dateOfCommencement!.day.toString().padLeft(2, '0')}",
        "constitution": constitution,
        "constitutionFile": constitutionFile,
        "name": name,
        "endingWith": endingWith,
        "isicCode": isicCode == null
            ? []
            : List<dynamic>.from(isicCode!.map((x) => x.toJson())),
        "parentcompanyName": parentcompanyName,
        "registrationNumberOfParentCompany": registrationNumberOfParentCompany,
        "partnershipName": partnershipName,
        "partners": partners == null
            ? []
            : List<dynamic>.from(partners!.map((x) => x.toJson())),
        "tin": tin,
      };
}

class IsicCode {
  final String? value;
  final String? label;

  IsicCode({
    this.value,
    this.label,
  });

  factory IsicCode.fromJson(Map<String, dynamic> json) => IsicCode(
        value: json["value"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
      };
}

class CorportateSecretary {
  final String? corporateName;
  final String? representativeName;
  final String? representativeEmail;
  final String? representativePhone;

  CorportateSecretary({
    this.corporateName,
    this.representativeName,
    this.representativeEmail,
    this.representativePhone,
  });

  factory CorportateSecretary.fromJson(Map<String, dynamic> json) =>
      CorportateSecretary(
        corporateName: json["corporateName"],
        representativeName: json["representativeName"],
        representativeEmail: json["representativeEmail"],
        representativePhone: json["representativePhone"],
      );

  Map<String, dynamic> toJson() => {
        "corporateName": corporateName,
        "representativeName": representativeName,
        "representativeEmail": representativeEmail,
        "representativePhone": representativePhone,
      };
}

class Director {
  final String? name;
  final String? email;
  final String? phone;

  Director({
    this.name,
    this.email,
    this.phone,
  });

  factory Director.fromJson(Map<String, dynamic> json) => Director(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
      };
}

class MsmeDetails {
  final String? revenueEnvisaged;
  final String? noOfEmployeesEnvisaged;
  final String? businessOperatingPermit;

  MsmeDetails({
    this.revenueEnvisaged,
    this.noOfEmployeesEnvisaged,
    this.businessOperatingPermit,
  });

  factory MsmeDetails.fromJson(Map<String, dynamic> json) => MsmeDetails(
        revenueEnvisaged: json["revenueEnvisaged"],
        noOfEmployeesEnvisaged: json["noOfEmployeesEnvisaged"],
        businessOperatingPermit: json["businessOperatingPermit"],
      );

  Map<String, dynamic> toJson() => {
        "revenueEnvisaged": revenueEnvisaged,
        "noOfEmployeesEnvisaged": noOfEmployeesEnvisaged,
        "businessOperatingPermit": businessOperatingPermit,
      };
}

class Ess {
  final String? digitalAddress;
  final String? houseNumber;
  final String? streetName;
  final String? city;
  final String? district;
  final Region? region;
  final Country? country;

  Ess({
    this.digitalAddress,
    this.houseNumber,
    this.streetName,
    this.city,
    this.district,
    this.region,
    this.country,
  });

  factory Ess.fromJson(Map<String, dynamic> json) => Ess(
        digitalAddress: json["digitalAddress"],
        houseNumber: json["houseNumber"],
        streetName: json["streetName"],
        city: json["city"],
        district: json["district"],
        region: regionValues.map[json["region"]]!,
        country: countryValues.map[json["country"]]!,
      );

  Map<String, dynamic> toJson() => {
        "digitalAddress": digitalAddress,
        "houseNumber": houseNumber,
        "streetName": streetName,
        "city": city,
        "district": district,
        "region": regionValues.reverse[region],
        "country": countryValues.reverse[country],
      };
}

enum Country { GHANA, UNITED_STATES }

final countryValues = EnumValues(
    {"Ghana": Country.GHANA, "United States": Country.UNITED_STATES});

class ParticularsOfChargesOnPartnershipAssets {
  final String? descriptionOfAssets;
  final DateTime? dateOfBirth;
  final int? amountOfCharge;

  ParticularsOfChargesOnPartnershipAssets({
    this.descriptionOfAssets,
    this.dateOfBirth,
    this.amountOfCharge,
  });

  factory ParticularsOfChargesOnPartnershipAssets.fromJson(
          Map<String, dynamic> json) =>
      ParticularsOfChargesOnPartnershipAssets(
        descriptionOfAssets: json["descriptionOfAssets"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        amountOfCharge: json["amountOfCharge"],
      );

  Map<String, dynamic> toJson() => {
        "descriptionOfAssets": descriptionOfAssets,
        "dateOfBirth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "amountOfCharge": amountOfCharge,
      };
}

class PostalAddress {
  final String? type;
  final String? number;
  final String? town;
  final String? region;

  PostalAddress({
    this.type,
    this.number,
    this.town,
    this.region,
  });

  factory PostalAddress.fromJson(Map<String, dynamic> json) => PostalAddress(
        type: json["type"],
        number: json["number"],
        town: json["town"],
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
        "town": town,
        "region": region,
      };
}

class ProprietorDetails {
  final PersonalInformation? personalInformation;
  final Contact? contact;

  ProprietorDetails({
    this.personalInformation,
    this.contact,
  });

  factory ProprietorDetails.fromJson(Map<String, dynamic> json) =>
      ProprietorDetails(
        personalInformation: json["personalInformation"] == null
            ? null
            : PersonalInformation.fromJson(json["personalInformation"]),
        contact:
            json["contact"] == null ? null : Contact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "personalInformation": personalInformation?.toJson(),
        "contact": contact?.toJson(),
      };
}

class Contact {
  final String? mobileNumber1;
  final String? mobileNumber2;
  final String? fax;
  final String? emailAddress;

  Contact({
    this.mobileNumber1,
    this.mobileNumber2,
    this.fax,
    this.emailAddress,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        mobileNumber1: json["mobileNumber_1"],
        mobileNumber2: json["mobileNumber_2"],
        fax: json["fax"],
        emailAddress: json["emailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber_1": mobileNumber1,
        "mobileNumber_2": mobileNumber2,
        "fax": fax,
        "emailAddress": emailAddress,
      };
}

class PersonalInformation {
  final String? title;
  final String? sex;
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String? formerName;
  final String? nationality;
  final String? occupation;
  final String? ghanaCard;
  final String? tin;

  PersonalInformation({
    this.title,
    this.sex,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.formerName,
    this.nationality,
    this.occupation,
    this.ghanaCard,
    this.tin,
  });

  factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
      PersonalInformation(
        title: json["title"],
        sex: json["sex"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        formerName: json["formerName"],
        nationality: json["nationality"],
        occupation: json["occupation"],
        ghanaCard: json["ghanaCard"],
        tin: json["tin"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "sex": sex,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "formerName": formerName,
        "nationality": nationality,
        "occupation": occupation,
        "ghanaCard": ghanaCard,
        "tin": tin,
      };
}

class RegulatoryRequirements {
  final String? revenueEnvisaged;
  final String? noOfEmployeesEnvisaged;
  final String? boNumber;
  final String? amountGuaranteed;

  RegulatoryRequirements({
    this.revenueEnvisaged,
    this.noOfEmployeesEnvisaged,
    this.boNumber,
    this.amountGuaranteed,
  });

  factory RegulatoryRequirements.fromJson(Map<String, dynamic> json) =>
      RegulatoryRequirements(
        revenueEnvisaged: json["revenueEnvisaged"],
        noOfEmployeesEnvisaged: json["noOfEmployeesEnvisaged"],
        boNumber: json["boNumber"],
        amountGuaranteed: json["amountGuaranteed"],
      );

  Map<String, dynamic> toJson() => {
        "revenueEnvisaged": revenueEnvisaged,
        "noOfEmployeesEnvisaged": noOfEmployeesEnvisaged,
        "boNumber": boNumber,
        "amountGuaranteed": amountGuaranteed,
      };
}

class SharesAndCapital {
  final String? authorizedShares;
  final String? statedCapital;
  final EachClass? authorizedSharesOfEachClass;
  final EachClass? issuedSharesOfEachClass;
  final EachClass? amountPaidInCashOfEachClass;
  final EachClass? amountPaidOtherwiseThanInCashOfEachClass;
  final EachClass? amountRemainingToBePaidOnEachClass;

  SharesAndCapital({
    this.authorizedShares,
    this.statedCapital,
    this.authorizedSharesOfEachClass,
    this.issuedSharesOfEachClass,
    this.amountPaidInCashOfEachClass,
    this.amountPaidOtherwiseThanInCashOfEachClass,
    this.amountRemainingToBePaidOnEachClass,
  });

  factory SharesAndCapital.fromJson(Map<String, dynamic> json) =>
      SharesAndCapital(
        authorizedShares: json["authorizedShares"],
        statedCapital: json["statedCapital"],
        authorizedSharesOfEachClass: json["authorizedSharesOfEachClass"] == null
            ? null
            : EachClass.fromJson(json["authorizedSharesOfEachClass"]),
        issuedSharesOfEachClass: json["issuedSharesOfEachClass"] == null
            ? null
            : EachClass.fromJson(json["issuedSharesOfEachClass"]),
        amountPaidInCashOfEachClass: json["amountPaidInCashOfEachClass"] == null
            ? null
            : EachClass.fromJson(json["amountPaidInCashOfEachClass"]),
        amountPaidOtherwiseThanInCashOfEachClass:
            json["amountPaidOtherwiseThanInCashOfEachClass"] == null
                ? null
                : EachClass.fromJson(
                    json["amountPaidOtherwiseThanInCashOfEachClass"]),
        amountRemainingToBePaidOnEachClass:
            json["amountRemainingToBePaidOnEachClass"] == null
                ? null
                : EachClass.fromJson(
                    json["amountRemainingToBePaidOnEachClass"]),
      );

  Map<String, dynamic> toJson() => {
        "authorizedShares": authorizedShares,
        "statedCapital": statedCapital,
        "authorizedSharesOfEachClass": authorizedSharesOfEachClass?.toJson(),
        "issuedSharesOfEachClass": issuedSharesOfEachClass?.toJson(),
        "amountPaidInCashOfEachClass": amountPaidInCashOfEachClass?.toJson(),
        "amountPaidOtherwiseThanInCashOfEachClass":
            amountPaidOtherwiseThanInCashOfEachClass?.toJson(),
        "amountRemainingToBePaidOnEachClass":
            amountRemainingToBePaidOnEachClass?.toJson(),
      };
}

class EachClass {
  final String? equityShares;
  final String? preferenceShares;

  EachClass({
    this.equityShares,
    this.preferenceShares,
  });

  factory EachClass.fromJson(Map<String, dynamic> json) => EachClass(
        equityShares: json["equityShares"],
        preferenceShares: json["preferenceShares"],
      );

  Map<String, dynamic> toJson() => {
        "equityShares": equityShares,
        "preferenceShares": preferenceShares,
      };
}

class ReservedName {
  final String? companyName;
  final String? entityType;
  final List<String>? sectors;
  final List<IsicCode>? isicCodes;
  final String? objectsOfCompany;

  ReservedName({
    this.companyName,
    this.entityType,
    this.sectors,
    this.isicCodes,
    this.objectsOfCompany,
  });

  factory ReservedName.fromJson(Map<String, dynamic> json) => ReservedName(
        companyName: json["companyName"],
        entityType: json["entityType"],
        sectors: json["sectors"] == null
            ? []
            : List<String>.from(json["sectors"]!.map((x) => x)),
        isicCodes: json["isicCodes"] == null
            ? []
            : List<IsicCode>.from(
                json["isicCodes"]!.map((x) => IsicCode.fromJson(x))),
        objectsOfCompany: json["objectsOfCompany"],
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "entityType": entityType,
        "sectors":
            sectors == null ? [] : List<dynamic>.from(sectors!.map((x) => x)),
        "isicCodes": isicCodes == null
            ? []
            : List<dynamic>.from(isicCodes!.map((x) => x.toJson())),
        "objectsOfCompany": objectsOfCompany,
      };
}

class UserDetails {
  final String? name;
  final String? otp;
  final String? card;
  final String? phoneNumber;
  final String? email;

  UserDetails({
    this.name,
    this.otp,
    this.card,
    this.phoneNumber,
    this.email,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"],
        otp: json["OTP"],
        card: json["card"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "OTP": otp,
        "card": card,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

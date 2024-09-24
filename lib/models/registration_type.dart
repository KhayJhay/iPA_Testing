class RegistrationType {
  final String title;
  final String description;
  final List<Procedure> procedures;
  final List<Pricing> pricing;
  final List<String> documentsRequired;
  final List<String> documentsDescription;
  final String videoID;

  RegistrationType({
    required this.title,
    required this.description,
    required this.procedures,
    required this.pricing,
    required this.documentsRequired,
    required this.documentsDescription,
    required this.videoID,
  });
}

class Procedure {
  final String number;
  final String title;
  final String description;

  Procedure({
    required this.number,
    required this.title,
    required this.description,
  });
}

class Pricing {
  final String title;
  final String subTitle;
  final String price;

  Pricing({
    required this.title,
    required this.subTitle,
    required this.price,
  });
}

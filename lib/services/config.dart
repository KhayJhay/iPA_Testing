class Config {
  static const apiUrl = "http://139.99.8.218:9010/api/v1";
  static const String indivSignupUrl = "$apiUrl/auth/register";
  static const String corpSignupUrl = "$apiUrl/auth/register/corperate";
  static const String nonGhSignupUrl = "";
  static const String loginUrl = "$apiUrl/auth/login";
  static const String logoutUrl = "$apiUrl/auth/logout";
  static const String generateOtpUrl = "$apiUrl/auth/otp";
  static const String createBusinessUrl = "$apiUrl/company/";
  static const String getSectorsUrl = "$apiUrl/company/sectors/";
  static const String getIsicsUrl = "$apiUrl/company/isic_codes/";
  static const String entitySearchUrl = "$apiUrl/company/search/?search=";
  static const String basicSearchUrl = "$apiUrl/company/names/?search=";
  static const String verifyAccountUrl = "$apiUrl/auth/user/verify";
}

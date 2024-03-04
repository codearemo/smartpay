class ApiEndpoints {
  // Account Module
  static const String sigin = 'auth/login';
  static const String signup = 'auth/register';
  static const String signout = 'auth/logout';
  static const String requestVerification = 'auth/email';
  static const String verifyEmail = 'auth/email/verify';

  // Utils Module
  static const String dashboard = 'dashboard';
  static const String countries = 'https://restcountries.com/v3.1/region/africa?fields=flags,flag,code,name';
}

class API {
  final String baseUrl = 'http://192.168.43.20:5000';

  String get registerUrl => '$baseUrl/api/user/sign-up';
  String get loginUrl => '$baseUrl/api/user/sign-in';
  String get updateProfile => '$baseUrl/api/user/update-profile/';
}

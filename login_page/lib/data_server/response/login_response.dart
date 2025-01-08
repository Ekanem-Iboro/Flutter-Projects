import 'package:login_page/data_server/modal/user_from_api.dart';

class LoginResponse {
  final User? user;
  final String? token;

  LoginResponse({this.user, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: User.fromJson(json),
        token: json['accessToken'],
      );
}

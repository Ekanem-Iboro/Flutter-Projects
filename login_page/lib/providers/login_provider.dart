import 'package:flutter/material.dart';
import 'package:login_page/data_server/response/login_response.dart';
import 'package:login_page/data_server/server_request/login_service.dart';

class LoginProvider extends ChangeNotifier {
  var username = '';
  var password = '';
  int? userId; // To store the logged-in user ID

  Future<LoginResponse> login() async {
    final response = await LoginService(
      usernamelog: username,
      passwordlog: password,
    ).call();

    // Save the user ID
    userId = response.user?.id;
    notifyListeners();

    return response;
  }
}

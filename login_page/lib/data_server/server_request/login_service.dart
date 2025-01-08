import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_page/config/app_api_config.dart';
import 'package:login_page/data_server/response/login_response.dart';
import 'package:login_page/data_server/server_request/base_service.dart';

class LoginService extends BaseService<LoginResponse> {
  final String usernamelog;
  final String passwordlog;

  LoginService({
    required this.usernamelog,
    required this.passwordlog,
  });

  @override
  Future<LoginResponse> call() async {
    final result = await http.post(
      Uri.parse('${AppApiConfig.baseAPI}/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'username': usernamelog,
          'password': passwordlog,
        },
      ),
    );

    if (result.statusCode == 200) {
      final response = LoginResponse.fromJson(jsonDecode(result.body));
      return response;
    } else {
      throw Exception('Failed to login: ${result.body}');
    }
  }
}

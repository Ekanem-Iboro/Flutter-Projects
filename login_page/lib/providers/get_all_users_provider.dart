import 'package:flutter/material.dart';
import 'package:login_page/data_server/modal/user_profile.dart';
import 'package:login_page/data_server/server_request/get_all_users_service.dart';

class GetAllUsersProvider extends ChangeNotifier {
  Future<List<UserProfile>> getAllUsers() async {
    return await GetAllUsersService().call();
  }
}

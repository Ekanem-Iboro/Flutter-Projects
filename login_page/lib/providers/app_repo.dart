import 'package:flutter/material.dart';
import 'package:login_page/data_server/modal/user_from_api.dart';
import 'package:login_page/data_server/modal/user_profile.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;
  UserProfile? profile;

  AppRepo({String? token}) : _token = token;

  set token(String? value) => _token = value;

  // ignore: unnecessary_getters_setters
  String? get token => _token;
}

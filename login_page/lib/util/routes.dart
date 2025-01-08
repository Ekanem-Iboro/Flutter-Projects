import 'package:flutter/material.dart';
import 'package:login_page/data_server/modal/user_from_api.dart';
import 'package:login_page/pages/Auth/login.dart';
import 'package:login_page/pages/edit_profile.dart';
import 'package:login_page/pages/home.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/pages/nearby_location.dart';
import 'package:login_page/pages/user_page.dart';
import 'package:login_page/providers/login_provider.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static final pages = {
    login: (context) => ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: const Login()),
    home: (context) => Home(),
    main: (context) => const MainPage(),
    editPage: (context) => const EditProfile(),
    nearbyLocation: (context) => const NearbyLocation(),
    userpage: (context) => UserPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editPage = '/edit_profile';
  static const nearbyLocation = '/nearby_location';
  static const userpage = '/userpage';
}

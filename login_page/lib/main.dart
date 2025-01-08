import 'package:flutter/material.dart';
import 'package:login_page/providers/app_repo.dart';
import 'package:login_page/providers/get_all_users_provider.dart';
import 'package:login_page/providers/post_provider.dart';
// import 'package:login_page/providers/user_provider.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:login_page/styles/app_colors.dart';
import 'package:login_page/util/routes.dart';
import 'package:provider/provider.dart';

void main() {
  // await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppRepo>(
          create: (context) => AppRepo(),
        ),
        ChangeNotifierProvider<PostProvider>(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider<PostProvider>(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetAllUsersProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.bgColor,
        brightness: Brightness.dark,
      ),

      // home: const Login(),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.pages,
    );
  }
}

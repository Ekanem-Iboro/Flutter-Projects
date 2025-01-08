import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:login_page/components/btn.dart';
import 'package:login_page/components/btn_use_signinwith.dart';
import 'package:login_page/components/text_field.dart';
import 'package:login_page/data_server/server_request/profile_per_user_get_service.dart';
import 'package:login_page/data_server/modal/user_from_api.dart';
import 'package:login_page/pages/main_page.dart';
import 'package:login_page/providers/app_repo.dart';
import 'package:login_page/providers/login_provider.dart';
import 'package:login_page/providers/user_provider.dart';
import 'package:login_page/util/routes.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  // final usernameController = TextEditingController();
  // var username = '';
  // var password = '';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'Hello, Welcome Back',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Login to continue',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                CustomTextField(
                    onChanged: (value) => {
                          Provider.of<LoginProvider>(context, listen: false)
                              .username = value,
                        },

                    // control: usernameController,
                    inputHintText: 'Username'),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                    onChanged: (value) => {
                          Provider.of<LoginProvider>(context, listen: false)
                              .password = value,
                        },
                    inputHintText: 'Password'),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => {},
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text(
                      'Forgot Password?',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
//
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      final loginProvider = context.read<LoginProvider>();

                      // Trigger login
                      loginProvider.login().then((loginResponse) {
                        // Store user and token in AppRepo
                        final appRepo =
                            Provider.of<AppRepo>(context, listen: false);
                        appRepo.user = loginResponse.user;
                        appRepo.token = loginResponse.token;

                        // Fetch user profile using the fetched user ID

                        final userId = loginResponse.user?.id;
                        if (userId != null) {
                          ProfileService()
                              .fetchUserProfile(userId)
                              .then((userProfile) {
                            // You can save the fetched user profile to AppRepo or another state
                            appRepo.profile = userProfile
                                .profile; // Assuming AppRepo can handle the full profile

                            // Navigate to the main page
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.main);
                          }).catchError((error) {
                            debugPrint("Login error: $error");
                          });
                        } else {
                          throw Exception(
                              "User ID is null after login. Cannot fetch profile.");
                        }
                      }).catchError((error) {
                        // Handle login error
                        debugPrint("Login error: $error");
                      });
                      // .pushReplacementNamed(AppRoutes.home
                      //);
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const Home(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                ),

                //

                const Spacer(),
                const Text(
                  'Or sign in with',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                const BtnUseSigninwith(
                    img: 'assets/images/google.png',
                    txt: ('Login with google')),
                const SizedBox(
                  height: 18,
                ),
                const BtnUseSigninwith(
                    img: 'assets/images/facebook.png',
                    txt: ('Login with facebook')),
                Row(
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

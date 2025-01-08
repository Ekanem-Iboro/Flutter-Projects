import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_page/config/app_api_config.dart';
import 'package:login_page/data_server/response/per_user_profile_response.dart';

class ProfileService {
  Future<UserProfileResponse> fetchUserProfile(int? userId) async {
    final result = await http.get(
      Uri.parse('${AppApiConfig.baseAPI}/user/$userId'),
    );

    if (result.statusCode == 200) {
      return UserProfileResponse.fromJson(jsonDecode(result.body));
    } else {
      throw Exception('Failed to fetch user profile: ${result.body}');
    }
  }
}

import 'package:login_page/data_server/modal/user_profile.dart';

class UserProfileResponse {
  final UserProfile profile;

  UserProfileResponse({required this.profile});
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      UserProfileResponse(profile: UserProfile.fromJson(json));
}

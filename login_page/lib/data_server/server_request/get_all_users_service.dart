import 'package:login_page/data_server/modal/user_profile.dart';
import 'package:login_page/data_server/server_request/base_service.dart';

class GetAllUsersService extends BaseService<List<UserProfile>> {
  GetAllUsersService();
  @override
  Future<List<UserProfile>> call() async {
    final result = await get('users?limit=0');

    return List.generate(
      result['users'].length,
      (index) => UserProfile.fromJson(
        result['users'][index],
      ),
    );
  }
}

import 'package:login_page/data_server/modal/post_modal.dart';
import 'package:login_page/data_server/server_request/base_service.dart';

class GetPostService extends BaseService<List<Post>> {
  GetPostService();
  @override
  Future<List<Post>> call() async {
    final result = await get('posts?limit=0');

    return List.generate(
      result['posts'].length,
      (index) => Post.fromJson(
        result['posts'][index],
      ),
    );
  }
}

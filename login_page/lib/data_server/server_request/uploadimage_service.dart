import 'package:login_page/data_server/server_request/base_service.dart';

class UploadimageService extends BaseService<String> {
  final String? path;

  UploadimageService({
    this.path,
  });

  @override
  Future<String> call() async {
    final result = await upload('upload', 'photo', path!);

    return result['data']['url'];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_page/data_server/modal/post_modal.dart';
import 'package:login_page/data_server/modal/user_profile.dart';
import 'package:login_page/data_server/server_request/create_pos_service.dart';
import 'package:login_page/data_server/server_request/get_post_service.dart';
import 'package:login_page/data_server/server_request/uploadimage_service.dart';
import 'package:login_page/providers/get_all_users_provider.dart';
import 'package:login_page/util/utils.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String content = '';
  String? imagePath;
  final List<UserProfile> users = [];

  getPost() async {
    list.clear();
    users.clear();
    list.addAll(await GetPostService().call());
    users.addAll(await GetAllUsersProvider().getAllUsers());
    //
    // Link posts to users
    for (var post in list) {
      post.owner = users.firstWhere(
        (user) => user.id == post.userId,
        orElse: () => UserProfile(
          id: -1,
          firstName: 'Unknown user',
          lastName: '',
          maidenName: '',
          age: -1,
          gender: '',
          email: '',
          phone: '',
          username: '',
          birthDate: '',
          image: 'https://cdn-icons-png.flaticon.com/512/219/219983.png',
          eyeColor: '',
          address: UserProfileAddress(
              address: '',
              city: '',
              state: '',
              stateCode: '',
              postalCode: '',
              coordinates: UserProfileCoordinates(lat: 0.0, lng: 0.0),
              country: ''),
        ),
      );
    }
    notifyListeners();
  }

  Future<void> createPost(id) async {
    // i can pass my image here to the parameter if needed
    await CreatePostSservice(title: 'New Post', content: content, userId: id)
        .call();

    content = '';
    getPost();
  }

  Future<String> upload() async {
    return await UploadimageService(path: imagePath!).call();
  }

  pickImage(ImageSource source) async {
    try {
      final path = await Utils.pickImage(source);
      final croppedImg = await Utils.cropImage(path);
      imagePath = croppedImg?.path ?? "";
      notifyListeners();
    } catch (e) {
      debugPrint('Error picking image: $e');
      return;
    }
  }

  deleteImage() {
    imagePath = null;
    notifyListeners();
  }
}

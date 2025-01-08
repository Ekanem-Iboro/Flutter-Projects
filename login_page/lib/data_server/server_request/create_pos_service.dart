import 'package:flutter/material.dart';
import 'package:login_page/data_server/server_request/base_service.dart';

class CreatePostSservice extends BaseService<void> {
  final String? title;
  final String? content;
  final int userId;

  // String token;

  CreatePostSservice({this.title, this.content, required this.userId});

  @override
  Future<void> call() async {
    final payload = {
      'title': title,
      'body': content,
      'userId': userId,
    };

    debugPrint("Request payload: $payload");

    await post(
      'posts/add',
      body: payload,
    );
  }
}

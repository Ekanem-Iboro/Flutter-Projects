import 'package:flutter/material.dart';
import 'package:login_page/data_server/modal/post_modal.dart';
import 'package:login_page/styles/app_text.dart';
import 'package:login_page/util/routes.dart';

class PostItems extends StatelessWidget {
  final Post post;
  const PostItems({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.userpage);
        },
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  post.owner?.image ?? '',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 16),
                Text(
                  '${post.owner?.firstName} ${post.owner?.lastName}',
                  style: AppText.subtitle3,
                )
              ],
            ),
            const SizedBox(height: 15),
            Image.asset('assets/temp/post.jpg'),
            const SizedBox(height: 14),
            Text(
              post.body,
              style: AppText.subtitle3,
            ),
          ],
        ),
      ),
    );
  }
}

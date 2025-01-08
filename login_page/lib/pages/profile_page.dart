import 'package:flutter/material.dart';
import 'package:login_page/components/appbar_header.dart';
import 'package:login_page/components/post_figure.dart';
import 'package:login_page/components/user_avatar.dart';
import 'package:login_page/providers/app_repo.dart';
import 'package:login_page/styles/app_text.dart';
import 'package:login_page/util/routes.dart';
import 'package:provider/provider.dart';

enum ProfileMenu {
  edit,
  logout,
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppRepo>(context).profile;
    return Scaffold(
      appBar: AppbarHeader(
        title: 'Profile',
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                // case 1 with a type of int:
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.editPage);
                  break;
                case ProfileMenu.logout:
                  debugPrint('Logout');
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: ProfileMenu.edit,
                  child: Text('Edit'),
                  // value: 1 and for the other items too 2, 3...
                ),
                const PopupMenuItem(
                  value: ProfileMenu.logout,
                  child: Text('Logout'),
                ),
              ];
            },
          ),

          // IconButton(
          //     onPressed: () => {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Column(
        children: [
          UserAvatar(
            img: '${user?.image}',
            size: 90,
          ),
          const SizedBox(height: 24),
          Text(
            '${user?.firstName} ${user?.lastName}',
            style: AppText.header2,
          ),
          const SizedBox(height: 12),
          const Text(
            'Nigeria',
            style: AppText.subtitle3,
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PostFigure(postNumber: '472', posttext: 'Followers'),
              PostFigure(postNumber: '119', posttext: 'Posts'),
              PostFigure(postNumber: '860', posttext: 'Following'),
            ],
          ),
          const Divider(
            thickness: 1,
            height: 26,
            indent: 19,
            endIndent: 19,
          ),
        ],
      ),
    );
  }
}

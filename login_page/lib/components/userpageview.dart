import 'package:flutter/material.dart';
import 'package:login_page/components/user_avatar.dart';
import 'package:login_page/data_server/modal/user_profile.dart';
import 'package:login_page/styles/app_colors.dart';
import 'package:login_page/styles/app_text.dart';

class Userpageview extends StatelessWidget {
  final UserProfile user;
  const Userpageview({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.4,
      // width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const UserAvatar(
                size: 50,
                img: 'https://cdn-icons-png.flaticon.com/512/219/219983.png',
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: AppText.subtitle1.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${user.address.city}, ${user.address.country}',
                    style: AppText.body2.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

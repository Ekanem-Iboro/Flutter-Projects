import 'package:flutter/material.dart';
import 'package:login_page/components/appbar_header.dart';
import 'package:login_page/components/btn.dart';
import 'package:login_page/components/text_field.dart';
import 'package:login_page/components/user_avatar.dart';
import 'package:login_page/styles/app_colors.dart';
import 'package:login_page/styles/app_text.dart';

enum Gender { none, male, female, others }

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarHeader(title: 'Edit Profile'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UserAvatar(
                      img: 'assets/temp/woman.png',
                      size: 90,
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              CustomTextField(
                  onChanged: (value) => {}, inputHintText: 'first name'),
              const SizedBox(height: 19),
              CustomTextField(
                  onChanged: (value) => {}, inputHintText: 'last name'),
              const SizedBox(height: 19),
              CustomTextField(
                  onChanged: (value) => {}, inputHintText: 'phone number'),
              const SizedBox(height: 19),
              CustomTextField(
                  onChanged: (value) => {}, inputHintText: 'location'),
              const SizedBox(height: 19),
              CustomTextField(
                  onChanged: (value) => {}, inputHintText: 'Birthday'),
              const SizedBox(height: 19),
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
                decoration: BoxDecoration(
                    color: AppColors.filledColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: AppText.body2.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Male'),
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = Gender.male;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Female'),
                              value: Gender.female,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = Gender.female;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Others'),
                              value: Gender.others,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = Gender.others;
                                });
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 19),

              // CustomTextField(

              //
              //inputHintText: 'first name'),
              // const BtnComp(
              //   txt: 'Edit',
              // )
            ],
          ),
        ),
      ),
    );
  }
}

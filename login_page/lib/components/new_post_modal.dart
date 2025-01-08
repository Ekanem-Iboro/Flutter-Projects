import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_page/components/text_field.dart';
import 'package:login_page/providers/app_repo.dart';
import 'package:login_page/providers/post_provider.dart';
import 'package:login_page/styles/app_colors.dart';
import 'package:login_page/styles/app_text.dart';
import 'package:provider/provider.dart';

class NewPostModal extends StatelessWidget {
  const NewPostModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Insert Message',
            style: AppText.header1,
          ),
          const SizedBox(
            height: 26,
          ),
          CustomTextField(
              inputHintText: 'Message.....',
              onChanged: (value) =>
                  {context.read<PostProvider>().content = value}),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Insert Message',
            style: AppText.header1,
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<PostProvider>(
            builder: (BuildContext context, value, Widget? child) =>
                GestureDetector(
              onTap: () {
                context.read<PostProvider>().pickImage(ImageSource.gallery);
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: value.imagePath == null
                    ? const Center(
                        child: Text('Upload from gallery'),
                      )
                    : ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: Stack(
                          children: [
                            Image.file(
                              File(value.imagePath!),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () =>
                                    context.read<PostProvider>().deleteImage(),
                                icon: const Icon(
                                  Icons.delete_forever_rounded,
                                  size: 40,
                                ),
                                color: Colors.red,
                                // iconSize: 40.0,
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('OR'),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
              onPressed: () {
                context.read<PostProvider>().pickImage(ImageSource.camera);
              },
              child: const Text('Camera')),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () => context.read<PostProvider>().createPost(
                      // context.read<AppRepo>().token!,
                      context.read<AppRepo>().user?.id).then(
                    (value) => Navigator.of(context).pop(),
                  ),
              child: const Text('Create Post'))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page/components/appbar_header.dart';
import 'package:login_page/components/post_items.dart';
import 'package:login_page/providers/app_repo.dart';
import 'package:login_page/providers/post_provider.dart';
import 'package:login_page/util/routes.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    postProvider.getPost();
    // context.read<PostProvider>().fetchPostsWithUsers();
  }

  @override
  Widget build(BuildContext context) {
    final user = (context).read<AppRepo>().profile;
    // mockServerUsers();
    return Scaffold(
      appBar: AppbarHeader(
        title: 'Welcome ${user?.firstName}',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.nearbyLocation);
            },
            icon: SvgPicture.asset('assets/svg/location.svg'),
          ),
        ],
      ), //so that the container and the appbar will have the same size
      body: Consumer<PostProvider>(
        builder: (BuildContext context, value, child) {
          // final users = value.list;
          return ListView.separated(
            itemBuilder: (context, index) {
              if (value.list.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return PostItems(
                // user: users[index],
                post: value.list[index],
              );
            },
            itemCount: value.list.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 24);
            },
          );
        },
      ),
    );
  }
}

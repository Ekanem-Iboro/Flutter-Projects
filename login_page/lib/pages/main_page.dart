import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page/components/btn_nav_item.dart';
import 'package:login_page/components/new_post_modal.dart';
import 'package:login_page/pages/home.dart';
import 'package:login_page/pages/profile_page.dart';
import 'package:login_page/styles/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Menus _selectedIndex = Menus.home;
  final  widgetOptions = [
    const Home(),
    const Center(child: Text("Favorite")),
    const Center(child: Text("Post")),
    const Center(child: Text("Message")),
    const ProfilePage(),
  ];
  // static final List<Widget> _widgetOptions = <Widget>[
  //   Home(),
  //   const Center(child: Text("Favorite")),
  //   const Center(child: Text("Post")),
  //   const Center(child: Text("Message")),
  //   const ProfilePage(user: widget.user),
  // ];

  // void _onSelectedItemtap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: widgetOptions[_selectedIndex.index],
        bottomNavigationBar: MyBtnNav(
          currentIdx: _selectedIndex,
          onTap: (value) {
            setState(() {
              if (value == Menus.add) {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return const NewPostModal();
                    });

                return;
              }
              _selectedIndex = value;
            });
          },
        ));
  }
}

enum Menus { home, favorite, add, chat, profile }

//
class MyBtnNav extends StatelessWidget {
  final Menus currentIdx;
  final ValueChanged<Menus> onTap;
  const MyBtnNav({
    super.key,
    required this.onTap,
    required this.currentIdx,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      margin: const EdgeInsets.all(25),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: BtnNavItem(
                        onPressed: () => onTap(Menus.home),
                        icon: 'assets/svg/home.svg',
                        current: currentIdx,
                        name: Menus.home),
                  ),
                  Expanded(
                    child: BtnNavItem(
                        onPressed: () => onTap(Menus.favorite),
                        icon: 'assets/svg/fav.svg',
                        current: currentIdx,
                        name: Menus.favorite),
                  ),
                  // Expanded(child: Container()),
                  const Spacer(),
                  Expanded(
                    child: BtnNavItem(
                        onPressed: () => onTap(Menus.chat),
                        icon: 'assets/svg/chat.svg',
                        current: currentIdx,
                        name: Menus.chat),
                  ),
                  Expanded(
                    child: BtnNavItem(
                        onPressed: () => onTap(Menus.profile),
                        icon: 'assets/svg/profile.svg',
                        current: currentIdx,
                        name: Menus.profile),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menus.add),
              child: Container(
                padding: const EdgeInsets.all(17),
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  'assets/svg/plus.svg',
                  colorFilter: ColorFilter.mode(
                      currentIdx == Menus.add
                          ? Colors.black
                          : Colors.black.withOpacity(0.3),
                      BlendMode.srcIn),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

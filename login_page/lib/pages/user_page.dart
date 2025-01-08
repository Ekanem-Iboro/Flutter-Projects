import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final scrollcontroller = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: scrollcontroller,
      slivers: [
        SliverToBoxAdapter(
            child: MYYserAppBar(
          offset: scrollcontroller.hasClients ? scrollcontroller.offset : 0,
        )),
        // SliverAppBar(
        //   pinned: true,
        //   title: const Text('User Name'),
        //   expandedHeight: MediaQuery.of(context).size.width * 0.7,
        //   flexibleSpace: FlexibleSpaceBar(
        //     background: Image.asset(
        //       'assets/temp/woman.png',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => Container(
              padding: const EdgeInsets.all(16),
              child: const Text('This is a post'),
            ),
            childCount: 50,
          ),
        )
      ],
    ));
  }
}

class MYYserAppBar extends StatelessWidget {
  final double offset;
  var expanded = true;
  MYYserAppBar({super.key, required this.offset});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final progress = offset / width;
    expanded = progress < 0.04;
    return AnimatedContainer(
      duration: const Duration(microseconds: 200),
      // curve: Curves.easeInBack,
      width: double.infinity,
      height: width - (expanded ? 0 : width - 260),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                  top: expanded
                      ? 0
                      : MediaQuery.of(context).viewPadding.top + 24),
              alignment: expanded ? null : Alignment.center,
              width: expanded ? width : 180,
              height: expanded ? width : 180,
              child: Image.asset(
                'assets/temp/woman.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 24,
            right: 24,
            child: AnimatedAlign(
              duration: const Duration(microseconds: 200),
              curve: Curves.fastOutSlowIn,
              alignment: expanded ? Alignment.centerLeft : Alignment.center,
              child: const Column(
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                  Text('User Location')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

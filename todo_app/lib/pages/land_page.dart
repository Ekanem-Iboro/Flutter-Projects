import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/profile.dart';
import 'package:todo_app/pages/settings.dart';
import 'package:todo_app/pages/todo.dart';

class InitPage extends StatefulWidget {
  InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _selectedidx = 0;

  final List _pages = [
    const MyHome(),
    const Todo(),
    const Profile(),
    const Settings(),
  ];

  void navigator(int idx) {
    setState(() {
      _selectedidx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Initial Page',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: _pages[_selectedidx],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory, // Disable ripple effect
          highlightColor: Colors.transparent, // Disable highlight effect
        ),
        child: BottomNavigationBar(
          enableFeedback: false, // Disable haptic feedback
          currentIndex: _selectedidx,
          type: BottomNavigationBarType.fixed,
          onTap: navigator,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}


      // drawer: Drawer(
      //   backgroundColor: Colors.deepPurple[500],
      //   surfaceTintColor: Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(0),
      //     ),
      //   ),
      //   child: Column(
      //     children: [
      //       DrawerHeader(
      //         child: Icon(
      //           Icons.home,
      //           size: 52,
      //           color: Colors.white,
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('H o m e'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/home');
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_circle),
      //         title: Text('P r o f i l e'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/profile');
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('S e t t i n g s'),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/settings');
      //         },
      //       )
      //     ],
      //   ),
      // ),
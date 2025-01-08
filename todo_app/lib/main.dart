// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/land_page.dart';
import 'package:todo_app/pages/profile.dart';
import 'package:todo_app/pages/settings.dart';
import 'package:todo_app/pages/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo_app/components/reuseable/appbar.dart';

void main() async {
  await Hive.initFlutter(); // Initialize Hive for storing data
  //open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitPage(),
      theme: ThemeData(
        useMaterial3: true, // Ensures compatibility with Material 3
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ).copyWith(
          primary: Colors.yellow[700], // Customize primary if needed
        ),
      ),
      initialRoute: '/init',
      routes: {
        '/init': (context) => InitPage(),
        '/home': (context) => MyHome(),
        '/todo': (context) => Todo(),
        '/settings': (context) => Settings(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppbarComp(
//           title: 'My App Bar',
//           icon1: Icons.menu,
//           icon2: Icons.logout,
//         ).buildAppBar(),
//         backgroundColor: Colors.deepPurple[200],
//         body: Center(
//           child: Container(
//             height: 300,
//             width: 300,
//             padding: EdgeInsets.all(30),
//             decoration: BoxDecoration(
//               color: Colors.deepPurple,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Icon(
//               Icons.favorite,
//               color: Colors.white,
//               size: 64,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

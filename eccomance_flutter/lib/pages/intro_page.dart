// import 'package:eccomance_flutter/pages/home_page.dart';
import 'package:eccomance_flutter/util/screen_size.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // // Get screen size
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    // Get screen size
    final screenHeight = ScreenSizeHelper.height(context);
    final screenWidth = ScreenSizeHelper.width(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/nike-logo.png',
                height: screenHeight * 0.4,
                width: screenWidth * 0.6,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Title
              const Text(
                'Just Do It',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Subtitle
              const Text(
                'Brand new sneakers and custom kicks made with premium quality',
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.05),
              // Button
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Shop Now!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class IntroPage extends StatelessWidget {
//   const IntroPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           // Determine screen size breakpoints
//           double maxWidth = constraints.maxWidth;

//           // For small screens
//           bool isSmallScreen = maxWidth < 600;

//           return Center(
//             child: Padding(
//               padding:
//                   EdgeInsets.symmetric(horizontal: isSmallScreen ? 16.0 : 32.0),
//               child: Column(
//                 children: [
//                   // Logo
//                   Image.asset(
//                     'assets/images/nike-logo.png',
//                     height: isSmallScreen ? 300 : 300,
//                     width: isSmallScreen ? 240 : 300,
//                   ),
//                   SizedBox(height: isSmallScreen ? 48.0 : 48.0),

//                   // Title
//                   const Text(
//                     'Just Do It',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: isSmallScreen ? 20.0 : 24.0),

//                   // Subtitle
//                   const Text(
//                     'Brand new sneakers and custom kicks made with premium quality',
//                     style: TextStyle(fontSize: 18, color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: isSmallScreen ? 24.0 : 48.0),

//                   // Button
//                   Container(
//                     width: isSmallScreen ? double.infinity : maxWidth * 0.4,
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Shop Now!',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

//
//1. create a veriable that stores the currency value
//2.Create a function that multiplies the value from the text feild
//3. store the value in the variable that was created
//4. display the variable
// change able state only works in statefull widget not stateless
//
//stateful
class MyCurrency extends StatefulWidget {
  const MyCurrency({super.key});
  @override
  State<MyCurrency> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyCurrency> {
  double result = 0;
  //
  final TextEditingController textEditingController = TextEditingController();
//
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //BORDER VARIABLE TO USE
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10),
    );
    //
    //
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₦ ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              TextField(
                controller:
                    textEditingController, // this gives us access to any user input
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  // label: Text('Put a number to be converted'),
                  hintText: 'Enter to Convert',
                  hintStyle: const TextStyle(
                    color: Colors.black54,
                  ),
                  suffixIcon: const Icon(Icons.monetization_on_outlined),
                  suffixIconColor: Colors.black54,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 750;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white54,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//ststeless
// class MyCurrencys extends StatelessWidget {
//   const MyCurrencys({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double result = 0;
// //
//     final TextEditingController textEditingController = TextEditingController();
// //
//     //BORDER VARIABLE TO USE
//     final border = OutlineInputBorder(
//       borderSide: const BorderSide(
//         color: Colors.white,
//         width: 2.0,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.circular(10),
//     );
//     //
//     //
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         elevation: 0,
//         title: const Text(
//           'Currency Converter',
//           style: TextStyle(
//             color: Colors.amber,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               result.toString(),
//               style: const TextStyle(
//                   fontSize: 45,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white70),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller:
//                     textEditingController, // this gives us access to any user input
//                 style: const TextStyle(
//                   color: Colors.black,
//                 ),
//                 decoration: InputDecoration(
//                   // label: Text('Put a number to be converted'),
//                   hintText: 'Enter to Convert',
//                   hintStyle: const TextStyle(
//                     color: Colors.black54,
//                   ),
//                   suffixIcon: const Icon(Icons.monetization_on_outlined),
//                   suffixIconColor: Colors.black54,
//                   filled: true,
//                   fillColor: Colors.white,
//                   focusedBorder: border,
//                   enabledBorder: border,
//                 ),
//                 keyboardType: const TextInputType.numberWithOptions(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: TextButton(
//                 onPressed: () {
//                   result = double.parse(textEditingController.text) * 750;
//                 },
//                 style: TextButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white54,
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   "Convert",
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//  ButtonStyle(
//                   backgroundColor: const WidgetStatePropertyAll(Colors.black),
//                   foregroundColor: const WidgetStatePropertyAll(Colors.white),
//                   minimumSize: const WidgetStatePropertyAll(
//                     Size(double.infinity, 50),
//                   ),
//                   shape: WidgetStatePropertyAll(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                         10,
//                       ),
//                     ),
//                   ),
//                 ),

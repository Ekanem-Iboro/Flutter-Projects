import 'package:flutter/cupertino.dart';

class CupertinoCurrency extends StatefulWidget {
  const CupertinoCurrency({super.key});

  @override
  State<CupertinoCurrency> createState() => _Cupertino();
}

class _Cupertino extends State<CupertinoCurrency> {
  double result = 0;
  //
  final TextEditingController textEditingController = TextEditingController();
//
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text(
          'Currency Converter',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      child: Center(
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
                  color: Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ),
                ),
              ),
              CupertinoTextField(
                controller:
                    textEditingController, // this gives us access to any user input
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                placeholder: 'Enter to Convert',
                suffix: const Icon(
                  CupertinoIcons.money_dollar,
                  color: Color.fromRGBO(6, 45, 87, 1),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                onPressed: () {
                  setState(
                    () {
                      result = double.parse(textEditingController.text) * 750;
                    },
                  );
                },
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    fontSize: 20,
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

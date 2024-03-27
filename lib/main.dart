import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController userValue = TextEditingController();
  double result = 0;

  void convert() {
    setState(() {
      // ignore: unrelated_type_equality_checks
      if (userValue == 0) {
        result = 0;
      } else {
        result = double.parse(userValue.text) * 80;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Convert INR to USD',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 145, 220, 130),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: textFieldMethod(),
              ),
              const SizedBox(height: 20),
              convertButton(),
              const SizedBox(height: 50),
              showConvertedValue()
            ],
          ),
        ),
      ),
    );
  }

  Container showConvertedValue() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Text(
        'USD ${result.toString()}',
        textAlign: TextAlign.center,
      ),
    );
  }

  SizedBox convertButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: convert,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 145, 220, 130)),
          foregroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 0, 0, 0)),
        ),
        child: Text('Convert'.toUpperCase()),
      ),
    );
  }

  Column textFieldMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Enter amount in INR : '),
        TextField(
          controller: userValue,
          keyboardType: const TextInputType.numberWithOptions(),
          cursorColor: const Color.fromARGB(255, 145, 220, 130),
          decoration: const InputDecoration(
            icon: Icon(Icons.currency_rupee_sharp),
            iconColor: Color.fromARGB(255, 145, 220, 130),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

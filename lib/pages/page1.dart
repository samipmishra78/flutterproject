import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  // const Page1({super.key});

  @override
  State<Page1> createState() => _FirstPageState();
}

class _FirstPageState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 245, 227, 227),
      body: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'GOOD AFTERNOON USER',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/covidbanner.png',
                  height: 400,
                  width: 360,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

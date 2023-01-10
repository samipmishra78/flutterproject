import 'dart:async';

// import 'package:finalproject/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:projectflutter/pages/loginPage.dart';

class splash extends StatefulWidget {
  // const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/mountainlogo1.png',
              height: 193,
              width: 210,
            ),
          ),
          // Image.asset(

          //   height: 100,
          //   width: 100,
          // ),
          Text(
            'LOADING',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
                height: 20,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 5,
              // ),
              Image.asset('assets/ellp.png'),
              SizedBox(
                width: 5,
              ),
              Image.asset('assets/ellp.png'),
              SizedBox(
                width: 5,
              ),
              Image.asset('assets/ellp.png'),
            ],
          ),
        ],
      ),
    );
  }
}

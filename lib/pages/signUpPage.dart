import 'package:flutter/material.dart';

import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passVisible = true;
  bool passConfirmVisible = true;

  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 25,
            ),
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/mountainlogo1.png',
                width: 147,
                height: 135,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Create your account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 108, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .0,
                  ),
                ),
              ),
//__________________________ Email _______________
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 15),
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20, top: 0),
                      hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 76, 76, 76),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 76, 76, 76),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 35),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, top: 0),
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 76, 76, 76),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 76, 76, 76),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),

//__________________________ confirm password_______________
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20, top: 0),
                  hintText: 'Confirm Password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 76, 76, 76),
                      width: 1,
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 0),
                height: 50,
                //  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Color.fromARGB(255, 34, 108, 255),
                            )),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 34, 108, 255),
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

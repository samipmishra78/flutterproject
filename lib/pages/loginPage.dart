import 'package:flutter/material.dart';
import 'package:projectflutter/Models/LoginModel.dart';
import 'package:projectflutter/pages/home.dart';
import 'package:projectflutter/pages/signUpPage.dart';
// import 'package:projectflutter/pages/signUpPage.dart';
// import 'package:ui/Models/LoginModel.dart';

import '../services/networkHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passVisible = true, value = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 25,
            ),
            children: [
              Image.asset(
                'assets/mountainlogo1.png',
                width: 160,
                height: 150,
              ),

              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Log on to your account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 34, 108, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .0,
                  ),
                ),
              ),
              //--- username -------
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 25),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, top: 0),
                    hintText: 'Email',

                    // prefixIcon: Icon(
                    //   Icons.person,
                    //   color: Colors.green,
                    // ),
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
                        color: Color.fromARGB(255, 77, 77, 77),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),

              //--- password -------
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: passVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, top: 0),
                    hintText: 'Password',
                    // prefixIcon: Icon(
                    //   Icons.lock,
                    //   color: Colors.green,
                    // ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passVisible = !passVisible;
                        });
                      },
                      icon: Icon(
                        passVisible ? Icons.visibility : Icons.visibility_off,
                        color: Color.fromARGB(255, 64, 64, 64),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 74, 74, 74),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 57, 57, 57),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Checkbox(
                        value: this.value,
                        onChanged: (bool? value) {},
                      ),
                    ),
                    Text(
                      'Remember Me',
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 35,
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 34, 108, 255),
                            letterSpacing: .2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0),
                height: 50,
                //  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .7,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onPressed: () async {
                      var phoneData = phoneController.text;
                      var passwordData = passwordController.text;
                      Login logindata = await NetworkHelper().getLogin(
                        phone: phoneData,
                        password: passwordData,
                      );

                      var status = logindata.status;
                      print(status);

                      if (status == 'success') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      } else {
                        //print('error');

                      }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      'Don\'t have account?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                        letterSpacing: .6,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpPage();
                          }));
                        });
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 34, 108, 255),
                          letterSpacing: .7,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui/Models/LoginModel.dart';
import 'package:ui/pages/loginPage.dart';

//  import 'login.dart';
// import 'package:flutter_final_project/login.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Column(
            children: [
              Image(
                image: AssetImage(
                  'assets/mountainlogo1.png',
                ),
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: const Text(
              'Create your account',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 117, 208),
                  fontFamily: 'Font30',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 226, 222, 222),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'password',
                  suffixIcon: Icon(Icons.remove_red_eye_outlined)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: ' confirm password',
                  suffixIcon: Icon(Icons.remove_red_eye_outlined)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
                onPressed: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                child: Text(
                  'sign up',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 2, 0, 3),
            child: Row(
              children: [
                Text(
                  'Do you have an account? ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

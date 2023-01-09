import 'package:flutter/material.dart';
import 'package:ui/pages/ProductDetail.dart';

import '../Models/getPost.dart';
import '../services/networkHelper.dart';

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Posts>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    posts = await NetworkHelper().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(
            color: Color.fromARGB(255, 34, 108, 255),
            fontSize: 22,
            fontWeight: FontWeight.w500,
            letterSpacing: .0,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 245, 252, 253),
      body: Container(
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Visibility(
              visible: isLoaded,
              child: Container(
                margin: EdgeInsets.all(20),
                child: Material(
                  elevation: 5.0,
                  shadowColor: Colors.blueGrey,
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: SizedBox(
                        child: Image.asset('images/flower.png'),
                      ),
                      title: Container(
                        child: Text(
                          posts![index].name ?? 'No Data',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,

                            // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                          ),
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Rs. ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 19, 107, 189),
                              fontSize: 18,

                              // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                            ),
                          ),
                          Text(
                            posts![index].price.toString(),
                            style: TextStyle(
                              color: Color.fromARGB(255, 19, 107, 189),
                              fontSize: 18,

                              // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color.fromARGB(255, 19, 96, 196),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  // const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

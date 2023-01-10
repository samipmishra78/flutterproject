// import 'package:final_project/models/cart_get.dart';
// import 'package:final_project/pages/product_detail.dart';
// import 'package:final_project/services/network.dart';
import 'package:flutter/material.dart';
import 'package:projectflutter/Models/getPost.dart';
import 'package:projectflutter/pages/productDetail.dart';
import 'package:projectflutter/services/networkHelper.dart';

class Page2 extends StatefulWidget {
  // const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  List<Posts>? posts;
  bool isloaded = false;

  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() async {
    posts = await NetworkHelper().getPosts();
    if (posts != Null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 23, 22, 22),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'Good Afternoon, User',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 23, 22, 22),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/covidbanner.png'),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isloaded,
                child: Container(
                  // color: Colors.green,
                  child: ListView.builder(
                    itemCount: posts?.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 105,
                            width: 360,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/rect.png',
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
                                        color:
                                            Color.fromARGB(255, 19, 107, 189),
                                        fontSize: 18,

                                        // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                                      ),
                                    ),
                                    Text(
                                      posts![index].price.toString(),
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 19, 107, 189),
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
                                      MaterialPageRoute(builder: (context) {
                                        return ProductDetail();
                                      }),
                                    );
                                  },
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                replacement: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

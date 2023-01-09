import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

import '../Models/getPost.dart';
import '../services/networkHelper.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<Posts>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    //print('Sagarmatha');
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 228, 196, 213),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 19, 96, 196),
          ),
        ),
        title: Container(
          child: Text(
            'Product Detail',
            style: TextStyle(
              color: Color.fromARGB(255, 34, 108, 255),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(children: [
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.8,
                color: Color.fromARGB(255, 236, 209, 224),
                child: SizedBox(
                  child: Image.asset('images/rose.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(
                    posts![0].name ?? 'No Data',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 30),
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Text(
                        'Rs.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 34, 108, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,

                          // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      posts![0].price.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 34, 108, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,

                        // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                      ),
                    ),
                  ),
                ],
              ),
              //___________________ Rating bar _______________________________________
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 28, bottom: 15),
                    child: RatingBar.builder(
                      itemSize: 20,
                      initialRating: posts![0].stars!.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 15),
                    child: Text(
                      posts![0].stars.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),

              Container(
                margin:
                    EdgeInsets.only(top: 5, bottom: 20, left: 30, right: 30),
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,

                      // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  child: Text(
                    posts![0].description ?? 'No data',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      letterSpacing: 1,
                      height: 1.5,
                      // backgroundColor: Color.fromARGB(255, 66, 66, 66),
                    ),
                  ),
                ),
              ),
              //---------------yo chai description wala ho------------------------------

              Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: SizedBox(
                        child: ElevatedButton(
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: .7,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 240, 233, 233),
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: Color.fromARGB(255, 34, 108, 255),
                                  )),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 34, 108, 255),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: SizedBox(
                        // width: double.maxFinite,
                        child: ElevatedButton(
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: .7,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 25, 89, 216),
                            ),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 255, 253, 253)),
                            elevation: MaterialStateProperty.all<double>(0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

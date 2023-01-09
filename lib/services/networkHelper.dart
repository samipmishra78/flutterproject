import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ui/Models/LoginModel.dart';

import '../Models/getPost.dart';

class NetworkHelper {
  Future<List<Posts>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("http://mark.bslmeiyu.com/api/getplaces");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var body = response.body;
      return postFromJson(body);
    }
  }

  Future<Login> getLogin({
    var phone,
    var password,
  }) async {
    var client = http.Client();
    var loginmodel;

    var uri = Uri.parse(
        'http://103.38.197.18/mobilebanking/api/v2/mdabaliReportUserLogin');
    var response = await client.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(
        <dynamic, dynamic>{
          "mobileno": phone,
          "password": password,
        },
      ),
    );

    if (response.statusCode == 200) {
      var body = response.body;
      var jsonMap = jsonDecode(body);
      loginmodel = Login.fromJson(jsonMap);
    }
    return loginmodel;
  }
}

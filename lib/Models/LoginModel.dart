class Login {
  String? status;
  int? statusCode;
  Data? data;
  String? message;

  Login({this.status, this.statusCode, this.data, this.message});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? name;
  String? mobileno;

  Data({this.name, this.mobileno});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileno = json['mobileno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobileno'] = this.mobileno;
    return data;
  }
}

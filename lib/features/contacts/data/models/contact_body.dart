class ContactBody {
  String? name;
  String? email;
  String? service;
  String? message;

  ContactBody({this.name, this.email, this.service, this.message});

  ContactBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    service = json['service'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['service'] = this.service;
    data['message'] = this.message;
    return data;
  }
}
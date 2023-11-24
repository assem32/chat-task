class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uid,
    this.token,
  });

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'];
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phone': phone,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uid,
  });

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    uid = json['uid'];
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phone': phone,
      'name': name,
      'email': email,
    };
  }
}

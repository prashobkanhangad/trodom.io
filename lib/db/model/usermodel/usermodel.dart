import 'dart:developer';

class UserModel {
  String? uid;
  String? email;
  String? name;
  String? profileimg;

  UserModel({this.uid, this.email, this.name, this.profileimg});

//recieving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map('uid'),
        email: map('email'),
        name: map('name'),
        profileimg: map('profileimg'));

  }

  // sending data to server

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'email': email, 'name': name, 'profileimg': profileimg};
  }
}

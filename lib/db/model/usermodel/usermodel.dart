class UserModel {
  String? uid;
  String? email;
  String? displayName;
  String? photoURL;

  UserModel({this.uid, this.email, this.displayName, this.photoURL});

//recieving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map('uid') as String,
        email: map('email') as String,
        displayName: map('displayName') as String,
        photoURL: map('photoURL') as String);
  }

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL
    };
  }
}

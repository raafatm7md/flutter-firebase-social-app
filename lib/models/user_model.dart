class UserModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? uId;
  String? image;
  String? cover;
  String? bio;
  bool? isEmailVerified;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.uId,
    required this.image,
    required this.cover,
    required this.bio,
    required this.isEmailVerified
});

  UserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'uId': uId,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerified': isEmailVerified
    };
  }
}
class UserModel {
  final String name;
  final String email;
  final String phone;
  final String uId;
  final String cover;
  final String image;
  final String bio;
  final bool isEmailVerified;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.cover,
    required this.image,
    required this.bio,
    required this.isEmailVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      uId: json['uId'],
      cover: json['cover'],
      image: json['image'],
      bio: json['bio'],
      isEmailVerified: json['isEmailVerified'],
    );
  }

  Map<String,dynamic>toMap()
  {
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uId' : uId,
      'cover' : cover,
      'image' : image,
      'bio' : bio,
      'isEmailVerified' : isEmailVerified,
  };
}
}

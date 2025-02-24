class ShamUser {
  String id;
  String name;
  String email;
  String password;
  String confirmPassword;
  String imageUrl;
  DateTime createdAt;
  String status;
  DateTime lastSeen;
  String phoneNumber;
  bool isVerified;
  String bio;
  List<String> friends;

  ShamUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.imageUrl,
    required this.createdAt,
    required this.status,
    required this.lastSeen,
    required this.phoneNumber,
    required this.isVerified,
    required this.bio,
    required this.friends, required String phone,
  });

  factory ShamUser.fromJson(Map<String, dynamic> json) {
    return ShamUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      status: json['status'],
      lastSeen: DateTime.parse(json['lastSeen']),
      phoneNumber: json['phoneNumber'],
      isVerified: json['isVerified'],
      bio: json['bio'],
      friends: List<String>.from(json['friends']), phone: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
      'lastSeen': lastSeen.toIso8601String(),
      'phoneNumber': phoneNumber,
      'isVerified': isVerified,
      'bio': bio,
      'friends': friends,
    };
  }
}

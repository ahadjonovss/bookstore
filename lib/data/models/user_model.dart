class User {
  User({
    this.userId,
    this.fullName,
    this.email,
    this.age,
    this.createdAt,
  });

  int? userId;
  String? fullName;
  String? email;
  int? age;
  String? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    fullName: json["full_name"],
    email: json["email"],
    age: json["age"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "full_name": fullName,
    "email": email,
    "age": age,
    "created_at": createdAt,
  };
}
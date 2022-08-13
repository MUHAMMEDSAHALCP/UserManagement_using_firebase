class UserModel {
  String? name;
  String? email;
  String? phone;
  String? id;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}

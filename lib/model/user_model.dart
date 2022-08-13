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

//getting data from firestore
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      id: json["id"],
    );
  }

//adding data to firestore
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}

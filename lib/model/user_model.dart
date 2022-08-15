class UserModel {
  String? name;
  String? email;
  String? phone;
  String? id;
  String? age;
  String? image;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.id,
    this.age,
    this.image,
  });

//getting data from firestore
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      id: json["uid"],
      age: json["age"],
      image: json["image"],
    );
  }

//adding data to firestore
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "age": age,
      "image": image,
    };
  }
}

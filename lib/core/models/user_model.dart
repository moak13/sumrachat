class UserModel {
  String? firstName;
  String? lastName;
  String? image;
  num? id;

  UserModel({
    this.firstName,
    this.lastName,
    this.image,
    this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    id = json['id'];
  }

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}

class UserModel {
  String? firstName;
  String? lastName;
  String? image;
  num? id;
  num? authenticated;

  UserModel({
    this.firstName,
    this.lastName,
    this.image,
    this.id,
    this.authenticated,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    authenticated = json['is_authenticated'];
    id = json['id'];
  }

  String get fullName => '$firstName $lastName';

  bool get isAuthenticated => authenticated == 0 ? false : true;

  static const userToLogIn = {
    "first_name": "Michael",
    "last_name": "Kalango",
    "image": "user_1.png",
    'is_authenticated': 1,
    "id": 1,
  };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['id'] = this.id;
    data['is_authenticated'] = this.authenticated;
    return data;
  }
}

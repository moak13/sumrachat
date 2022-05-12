import '../models/user_model.dart';

const List<Map<String, dynamic>> _users = [
  {
    "first_name": "Joshua",
    "last_name": "Lawrence",
    "image": "assets/png/user_2.png",
    "id": 2,
  },
  {
    "first_name": "Martin",
    "last_name": "Randolph",
    "image": "assets/png/user_3.png",
    "id": 3,
  },
  {
    "first_name": "Karen",
    "last_name": "Castillo",
    "image": "assets/png/user_4.png",
    "id": 4,
  },
  {
    "first_name": "Andrew",
    "last_name": "Parker",
    "image": "assets/png/user_5.png",
    "id": 5,
  },
  {
    "first_name": "Maisy",
    "last_name": "Humphrey",
    "image": "assets/png/user_6.png",
    "id": 6,
  }
];

List<UserModel> get users {
  final data = _users.map<UserModel>((e) => UserModel.fromJson(e)).toList();
  return data;
}

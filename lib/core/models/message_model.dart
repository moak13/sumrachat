class MessageModel {
  num? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? image;
  num? userId;
  String? message;
  DateTime? dateTime;

  MessageModel({
    this.id,
    this.fullName,
    this.firstName,
    this.lastName,
    this.image,
    this.userId,
    this.message,
    this.dateTime,
  });

  MessageModel copyWith({
    num? id,
    String? fullName,
    String? firstName,
    String? lastName,
    String? image,
    num? userId,
    String? message,
    DateTime? dateTime,
  }) {
    return MessageModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      userId: userId ?? this.userId,
      message: message ?? this.message,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userId = json['user_id'];
    image = json['image'];
    message = json['sent_message'];
    dateTime = DateTime.parse(json['date_time']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_id'] = this.userId ?? 0;
    data['image'] = this.image;
    data['sent_message'] = this.message;
    data['date_time'] = DateTime.now().toIso8601String();
    return data;
  }
}

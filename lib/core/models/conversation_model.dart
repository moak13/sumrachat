class ConversationModel {
  num? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? image;
  num? userId;
  String? message;
  DateTime? dateTime;
  num? isMe;

  ConversationModel({
    this.id,
    this.fullName,
    this.firstName,
    this.lastName,
    this.image,
    this.userId,
    this.message,
    this.dateTime,
    this.isMe,
  });

  bool? get isReallyMe {
    bool data = isMe == 1 ? true : false;
    return data;
  }

  ConversationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userId = json['user_id'];
    image = json['image'];
    message = json['sent_message'];
    isMe = json['is_me'];
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
    data['is_me'] = this.isMe;
    data['date_time'] = DateTime.now().toIso8601String();
    return data;
  }
}

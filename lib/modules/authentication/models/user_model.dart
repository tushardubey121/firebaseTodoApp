class UserModel {
  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  String? photo;

  UserModel({this.userId, this.name, this.email, this.phoneNumber, this.photo});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['photo'] = this.photo;
    return data;
  }
}

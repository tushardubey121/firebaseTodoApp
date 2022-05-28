class AddTodoRequest {
  int? todoType;
  String? message;
  String? place;
  String? time;
  String? notification;
  String? createdBy;

  AddTodoRequest({
    this.todoType,
    this.message,
    this.place,
    this.time,
    this.notification,
    this.createdBy,
  });

  AddTodoRequest.fromJson(Map<String, dynamic> json) {
    todoType = json['todo_type'];
    message = json['message'];
    place = json['place'];
    time = json['time'];
    notification = json['notification'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todo_type'] = this.todoType;
    data['message'] = this.message;
    data['place'] = this.place;
    data['time'] = this.time;
    data['notification'] = this.notification;
    data['created_by'] = this.createdBy;
    return data;
  }
}

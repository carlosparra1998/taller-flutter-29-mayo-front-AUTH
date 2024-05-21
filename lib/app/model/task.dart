class Task {
  String? uuidTask;
  String? userName;
  String? title;
  String? description;
  String? color;
  bool? active;
  int? preference;

  Task({
    required this.uuidTask,
    required this.userName,
    required this.title,
    required this.description,
    required this.color,
    required this.active,
    required this.preference,
  });

  Task.fromJson(Map<String, dynamic> json) {
    uuidTask = json['uuidTask'];
    userName = json['userName'];
    title = json['title'];
    description = json['description'];
    color = json['color'];
    active = json['active'];
    preference = json['preference'];
  }
}

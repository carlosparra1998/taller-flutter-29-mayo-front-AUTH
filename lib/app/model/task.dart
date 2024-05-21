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
    uuidTask = json['title'];
    userName = json['userName'];
    title = json['title'];
    description = json['description'];
    color = json['color'];
    active = json['active'];
    preference = json['preference'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = title;
    json['description'] = description;
    json['color'] = color;
    json['active'] = active;
    json['preference'] = preference;
    return json;
  }
}

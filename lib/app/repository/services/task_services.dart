import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/repository/http_client.dart';

class TaskServices {
  static Future<HttpResponse> getTasks(String accessToken) async {
    return await HttpClient.get('tasks', accessToken: accessToken);
  }

  static Future<HttpResponse> addTask(Task task, String accessToken) async {
    return await HttpClient.post(
      'tasks',
      task.toJson(),
      accessToken: accessToken,
    );
  }
}

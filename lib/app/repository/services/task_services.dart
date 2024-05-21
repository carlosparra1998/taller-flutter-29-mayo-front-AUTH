import 'package:taller_29_mayo_front/app/repository/http_client.dart';

class TaskServices {
  static Future<HttpResponse> getTasks(String accessToken) async {
    return await HttpClient.get('tasks', accessToken: accessToken);
  }
}

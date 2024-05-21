import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/repository/http_client.dart';
import 'package:taller_29_mayo_front/app/repository/services/task_services.dart';
import 'package:taller_29_mayo_front/app/utils/toast.dart';

class HomeController extends ChangeNotifier {

  List<Task> userTasks = [];

  void getTasks(BuildContext context, String userAccessToken) async{
    HttpResponse response = await TaskServices.getTasks(userAccessToken);
    if(response.hasError){
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    dynamic t = jsonDecode(response.data);
  }

}
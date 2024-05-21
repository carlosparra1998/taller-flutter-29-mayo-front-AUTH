import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/repository/http_client.dart';
import 'package:taller_29_mayo_front/app/repository/services/task_services.dart';
import 'package:taller_29_mayo_front/app/utils/get_preference_from_key.dart';
import 'package:taller_29_mayo_front/app/utils/toast.dart';
import 'package:taller_29_mayo_front/app/view/auth/auth_controller.dart';

class HomeController extends ChangeNotifier {
  TextEditingController titleTask = TextEditingController();
  TextEditingController descriptionTask = TextEditingController();
  TextEditingController colorTask = TextEditingController();
  TextEditingController preferenceTask = TextEditingController();

  List<Task> userTasks = [];

  void getTasks(BuildContext context, String userAccessToken) async {
    HttpResponse response = await TaskServices.getTasks(userAccessToken);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    dynamic t = jsonDecode(response.data);
  }

  void addNewTask(BuildContext context, String userAccessToken) async {
    if (titleTask.text.isEmpty) {
      showToast(context, "Debes introducir al menos un título");
      return;
    }
    Task newTask = Task(
      uuidTask: "default",
      userName: context.read<AuthController>().logedUser!.userName ?? "",
      title: titleTask.text,
      description: descriptionTask.text,
      color: colorTask.text,
      active: true,
      preference: getPreferenceFromKey(preferenceTask.text),
    );
    HttpResponse response =
        await TaskServices.addTask(newTask, userAccessToken);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    newTask.uuidTask = jsonDecode(response.data)['data']['uuidTask'];
    userTasks.add(newTask);
    notifyListeners();
  }

  void modifierTask(BuildContext context, String userAccessToken) async {
    if (titleTask.text.isEmpty) {
      showToast(context, "Debes introducir al menos un título");
      return;
    }
    //TODO
    notifyListeners();
  }

  void changeStatusTask(BuildContext context, String userAccessToken) async {
    //TODO
    notifyListeners();
  }

  void setTaskInForm(Task task) {
    titleTask.text = task.title ?? "";
    descriptionTask.text = task.description ?? "";
    colorTask.text = task.color ?? "";
    preferenceTask.text = getKeyFromPreference(task.preference);
    notifyListeners();
  }

  void clearForms() {
    titleTask.clear();
    descriptionTask.clear();
    colorTask.clear();
    preferenceTask.clear();
    notifyListeners();
  }
}

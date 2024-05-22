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
    jsonDecode(response.data)["data"].map((element) => Task.fromJson(element)).toList();
    userTasks = (jsonDecode(response.data)["data"] as List).map((element) => Task.fromJson(element)).toList();
    notifyListeners();
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
      color: colorTask.text.isEmpty ? null : colorTask.text,
      active: true,
      preference: preferenceTask.text.isEmpty
          ? null
          : getPreferenceFromKey(preferenceTask.text),
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

  void modifierTask(
    BuildContext context,
    String uuidTask,
    String userAccessToken,
  ) async {
    if (titleTask.text.isEmpty) {
      showToast(context, "Debes introducir al menos un título");
      return;
    }
    Task modTask = Task(
      uuidTask: uuidTask,
      userName: context.read<AuthController>().logedUser!.userName ?? "",
      title: titleTask.text,
      description: descriptionTask.text,
      color: colorTask.text.isEmpty ? null : colorTask.text,
      active: true,
      preference: preferenceTask.text.isEmpty
          ? null
          : getPreferenceFromKey(preferenceTask.text),
    );
    HttpResponse response =
        await TaskServices.addTask(modTask, userAccessToken);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    int taskIndex = userTasks.indexWhere((e) => e.uuidTask == uuidTask);
    userTasks[taskIndex] = modTask;
    notifyListeners();
  }

  void changeStatusTask(
    BuildContext context,
    Task task,
    String userAccessToken,
  ) async {
    task.active = !task.active!;
    HttpResponse response = await TaskServices.modTask(task, userAccessToken);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    int index = userTasks.indexWhere((e) => task.uuidTask == e.uuidTask);
    userTasks[index].active = !task.active!;
    notifyListeners();
  }

  void deleteTask(
    BuildContext context,
    String uuidTask,
    String userAccessToken,
  ) async {
    HttpResponse response =
        await TaskServices.deleteTask(uuidTask, userAccessToken);
    if (response.hasError) {
      showToast(context, response.msg ?? "Error en el sistema");
      return;
    }
    userTasks.removeWhere((e) => e.uuidTask == uuidTask);

    notifyListeners();
  }

  void setTaskInForm(Task task) {
    titleTask.text = task.title ?? "";
    descriptionTask.text = task.description ?? "";
    colorTask.text = task.color ?? "";
    preferenceTask.text = getKeyFromPreference(task.preference);
    notifyListeners();
  }

  void changeColorFromDropdown(String? color) {
    colorTask.text = color ?? "";
    notifyListeners();
  }

  void changePreferenceFromDropdown(String? preference) {
    preferenceTask.text = preference ?? "";
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

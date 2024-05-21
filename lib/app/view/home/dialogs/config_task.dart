import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_29_mayo_front/app/model/task.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_button.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_dropdown.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_text_field.dart';
import 'package:taller_29_mayo_front/app/utils/get_color_from_key.dart';
import 'package:taller_29_mayo_front/app/utils/get_preference_from_key.dart';
import 'package:taller_29_mayo_front/app/view/auth/auth_controller.dart';
import 'package:taller_29_mayo_front/app/view/home/home_controller.dart';

Future<String?> configTaskDialog(
  BuildContext context,
  bool editMode,
  Task? taskEdit,
) async {
  editMode && taskEdit != null
      ? context.read<HomeController>().setTaskInForm(taskEdit)
      : context.read<HomeController>().clearForms();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.task),
          title: Text(editMode ? 'Editar Tarea' : 'Añadir Tarea'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15.0),
                MyTextField(
                  labelText: 'Título (requerido)',
                  smallMode: true,
                ),
                const SizedBox(height: 20),
                MyTextField(labelText: 'Descripción'),
                const SizedBox(height: 20),
                MyDropdown(
                  labelText: 'Color',
                  items: colorKeys,
                  value: null,
                  onChanged: (v) {},
                  smallMode: true,
                ),
                const SizedBox(height: 20),
                MyDropdown(
                  labelText: 'Prioridad',
                  items: preferenceKeys,
                  value: null,
                  onChanged: (v) {},
                  smallMode: true,
                ),
                const SizedBox(height: 20),
                MyButton(
                  label: 'Guardar',
                  onPressed: () {
                    context.read<HomeController>().addNewTask(
                          context,
                          context.read<AuthController>().getAccessTokenUser(),
                        );
                  },
                )
              ],
            ),
          ),
        );
      });
}

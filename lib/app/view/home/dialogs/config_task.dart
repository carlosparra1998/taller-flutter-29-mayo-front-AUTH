import 'package:flutter/material.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_button.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_dropdown.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_text_field.dart';
import 'package:taller_29_mayo_front/app/utils/get_color_from_key.dart';

Future<String?> configTaskDialog(BuildContext context, bool editMode) async {
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
                MyTextField(
                  labelText: 'Descripción',
                ),
                const SizedBox(height: 20),
                MyDropdown(
                  labelText: 'Color',
                  items: colorKeys,
                  value: null,
                  onChanged: (v) {
                  },
                  smallMode: true,
                ),
                const SizedBox(height: 20),
                MyButton(
                  label: 'Guardar',
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:taller_29_mayo_front/app/utils/get_color_from_key.dart';
import 'package:taller_29_mayo_front/app/view/home/dialogs/config_task.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        configTaskDialog(context, true);
      },
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(7),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: circleButton(context, "blue"),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title',
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'descr',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: deleteButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleButton(BuildContext context, String? taskColor) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: getColorFromKey(taskColor) ?? const Color(0xFF000000),
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          false ? null : Icons.check,
          color: getColorFromKey(taskColor),
        ),
      ),
    );
  }

  Widget deleteButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Icon(Icons.delete, size: 20),
    );
  }
}

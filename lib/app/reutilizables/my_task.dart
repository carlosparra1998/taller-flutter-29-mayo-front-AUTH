import 'package:flutter/material.dart';
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
                child: circleButton(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My task',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'My desc',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.7)),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: deleteButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.check),
    );
  }

  Widget deleteButton() {
    return const Icon(Icons.delete, size: 20);
  }
}

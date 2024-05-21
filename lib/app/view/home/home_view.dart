import 'package:flutter/material.dart';
import 'package:taller_29_mayo_front/app/reutilizables/my_task.dart';

import 'dialogs/config_task.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              14,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MyTask(),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          configTaskDialog(context, false);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget emptyMessage() {
    return const Text(
      'Para crear una tarea, presiona el botón flotante',
      style: TextStyle(fontSize: 20),
    );
  }
}

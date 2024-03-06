import 'package:flutter/material.dart';
import 'package:practica2/model/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoListScreen(tasks:lista),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
          itemCount:tasks.length,
        itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].title),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(task: tasks[index])));
              },
            );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.task
  });

  final Task task;

  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
         title: Text(task.title),
         backgroundColor: Colors.deepOrange,
       ),
      body: Center(
        child: Text(task.description),
      ),
    );
  }
}
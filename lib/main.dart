

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_daap/Screens/home_screen.dart';

import 'Controller/todo_controller.dart';

void main(){
  runApp(TodoDapp());
}

class TodoDapp extends StatelessWidget {
  const TodoDapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoController(),
      child: const MaterialApp(
          title: 'Todo Daap',
          debugShowCheckedModeBanner: false,
          home: HomeScreen()
      ),
    );
  }
}

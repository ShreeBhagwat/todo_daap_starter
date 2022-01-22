import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_daap/Controller/todo_controller.dart';
import 'package:todo_daap/Helper/constant.dart';
import 'package:todo_daap/Modals/todo.dart';
import 'dart:math' as math;

import 'package:todo_daap/Screens/add_todo_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TodoController todoController = TodoController();
  List<Todo> todos = [];




  @override
  Widget build(BuildContext context) {

    todoController = Provider.of<TodoController>(context, listen: true);
    todos = todoController.todos;


    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AddNewItemScreen()));
          }),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('TODO',
                    style: TextStyle(
                        color: kBackgroundColour,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              !todoController.isLoading
                  ? Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        height: 70,
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                todos[index].title,
                                style: const TextStyle(
                                  color: kBackgroundColour,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  deleteTodo(todos[index].id);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
                  : Center(
                child: Container(
                  width: 50,
                  height: 50,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          )),
    );
  }

 void deleteTodo(String todoInt) async {
    // await todoController.deleteTodo(int.parse(todoInt));
  }
}

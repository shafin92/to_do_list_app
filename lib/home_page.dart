import 'package:flutter/material.dart';
import 'package:to_do_list_app/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  List toDolist = [
    ["learn Todo", false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }
 void saveNewTask(){
    setState(() {
      toDolist.add([controller.text,false]);
      controller.clear();
    });
 }
 void deleteTask(int index){
setState(() {
  toDolist.removeAt(index);
});
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "                        Simple To-Do list App",
          textAlign: TextAlign.right,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDolist[index][0],
            taskcompleted: toDolist[index][1],
            onchanged: (value) => checkBoxChanged(index),
            deleteFunction:(contex) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Adjust alignment
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Add a new task",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: const Icon(Icons.add),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

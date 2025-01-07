import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskcompleted,
    required this.onchanged,
    required this.deleteFunction,
  });

final String taskName;
final bool taskcompleted;
final Function(bool?)? onchanged;
final Function(BuildContext)? deleteFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: deleteFunction,
              icon: Icons.delete,
                borderRadius: BorderRadius.circular(15),
                backgroundColor: Colors.red,
              )
            ]),
        child: Container(
          padding: const  EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
          ),
          child: Row(
            children: [
              Checkbox(
                  value: taskcompleted,
                  onChanged: onchanged,
               side:const BorderSide(
                 color: Colors.white,
               ),
              ),
              Text(
               taskName,
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskcompleted ? TextDecoration.lineThrough:
                  TextDecoration.none,
                  decorationColor: Colors.deepPurple,
                  decorationThickness: 2
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

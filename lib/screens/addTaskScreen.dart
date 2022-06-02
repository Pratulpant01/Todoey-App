import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/widgets/tasks_list.dart';

class AddTaskScreen extends StatelessWidget {
  String? addTaskTitle;

  AddTaskScreen({this.addTaskTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (newValue) {
                addTaskTitle = newValue;
              },
              decoration: InputDecoration(
                hintText: "Add your task here",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
              ),
              onPressed: () {
                if (addTaskTitle != null) {
                  Provider.of<TaskData>(context, listen: false)
                      .addNewTask(addTaskTitle!);
                  Navigator.pop(context);
                } else {
                  throw Exception("Please enter your task");
                }
              },
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}

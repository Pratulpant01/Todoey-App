import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_tile.dart';

import '../models/task_data.dart';

class taskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskName: task.taskName,
              isChecked: task.isDone,
              checkBoxCallback: (checkBoxState) {
                taskData.updateCheck(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          });
    });
  }
}

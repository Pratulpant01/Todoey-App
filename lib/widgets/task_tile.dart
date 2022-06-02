import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class TaskTile extends StatelessWidget {
  final String? taskName;
  bool? isChecked;
  final ValueChanged? checkBoxCallback;
  final VoidCallback? longPressCallback;

  TaskTile(
      {this.taskName,
      this.isChecked,
      this.checkBoxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: longPressCallback,
      child: ListTile(
        title: Text(
          taskName!,
          style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallback,
        ),
      ),
    );
  }
}

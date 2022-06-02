import 'dart:collection';

import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      taskName: "Buy Fruits",
    ),
    Task(
      taskName: "Learn Flutter",
    ),
    Task(
      taskName: "Go to the Gym",
    ),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addNewTask(String newValue) {
    final task = Task(taskName: newValue);
    _tasks.add(task);
    notifyListeners();
  }

  void updateCheck(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

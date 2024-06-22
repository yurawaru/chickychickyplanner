import 'package:chickychickyplanner/Model/task.dart';
import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void checkBox(bool value, Task task) {
    task.isDone = value;
    notifyListeners();
  }

  void editTask(Task task, String newTitle) {
    final taskIndex = _tasks.indexWhere((t) => t.id == task.id);
    if (taskIndex != -1) {
      _tasks[taskIndex].title = newTitle;
      notifyListeners();
    }
  }

  List<Task> getTaskItemsForCourse(String id) {
    List<Task> itemsForCourse = [];
    for (var item in _tasks) {
      if (item.courseId == id) {
        itemsForCourse.add(item);
      }
    }
    return itemsForCourse;
  }
}

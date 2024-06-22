import 'package:chickychickyplanner/Model/task.dart';
import 'package:chickychickyplanner/Provider/course_provider.dart';
import 'package:chickychickyplanner/Provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChecklistFunction extends StatefulWidget {
  const ChecklistFunction({super.key});

  @override
  State<ChecklistFunction> createState() => _ChecklistFunctionState();
}

class _ChecklistFunctionState extends State<ChecklistFunction> {
  final TextEditingController _taskController = TextEditingController();
  Task? _editedTask;

  void addTaskInfo(BuildContext context, String courseId) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      final taskProvider = Provider.of<TaskProvider>(context, listen: false);
      final taskId =
          _editedTask?.id ?? DateTime.now().millisecondsSinceEpoch.toString();

      if (_editedTask == null) {
        taskProvider.addTask(
          Task(
            title: taskText,
            isDone: false,
            id: taskId,
            courseId: courseId,
          ),
        );
      } else {
        taskProvider.editTask(_editedTask!, taskText);
        _editedTask = null;
      }

      _taskController.clear();
      Navigator.of(context).pop();
    }
  }

  void addTaskDialog(String courseId, [Task? taskToEdit]) {
    if (taskToEdit != null) {
      _taskController.text = taskToEdit.title;
      _editedTask = taskToEdit;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_editedTask == null ? 'New Task' : 'Edit Task'),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(labelText: 'Task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _taskController.clear();
                _editedTask = null;
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addTaskInfo(context, courseId);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Consumer<CourseProvider>(
      builder: (context, courseProvider, _) {
        return ListView.builder(
          itemCount: courseProvider.courseId.length,
          itemBuilder: (context, index) {
            final courseId = courseProvider.courseId[index];
            final courseName = courseProvider.coursename[index];
            final courseTaskItems =
                taskProvider.getTaskItemsForCourse(courseId);

            return Card(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              color: const Color.fromARGB(255, 255, 252, 247),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 76, 46, 2),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                      title: Text(
                    courseName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: courseTaskItems.length,
                    itemBuilder: (ctx, taskIndex) {
                      final item = courseTaskItems[taskIndex];
                      return Dismissible(
                        key: Key(item.id),
                        onDismissed: (direction) {
                          taskProvider.removeTask(item);
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          title: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: item.isDone
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  )
                                : const TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                  ),
                            child: Text(item.title),
                          ),
                          leading: Checkbox(
                            value: item.isDone,
                            onChanged: (value) {
                              taskProvider.checkBox(value!, item);
                            },
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              addTaskDialog(courseId, item);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () => addTaskDialog(courseId),
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 255, 252, 247),
                        backgroundColor: const Color.fromARGB(255, 76, 46, 2),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(0),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

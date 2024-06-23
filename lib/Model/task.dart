class Task {
  final String courseName;
  final String courseId;
  final String id;
  String title;
  bool isDone = false;
  DateTime? dueDate;

  Task({
    required this.title,
    required this.isDone,
    required this.id,
    required this.courseName,
    required this.courseId,
    this.dueDate,
  });
}

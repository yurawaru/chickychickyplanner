class Task {
  final String courseId;
  final String id;
  String title;
  bool isDone = false;

  Task(
      {required this.title,
      required this.isDone,
      required this.id,
      required this.courseId});
}

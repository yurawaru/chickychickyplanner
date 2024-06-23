import 'package:flutter/material.dart';

class CourseProvider with ChangeNotifier {
  final List<String> _courseTypeIndex = [
    "Compulsory",
    "General Education Course",
    "Department Required",
    "Basic Core Courses",
    "Core Courses",
    "Professional Courses",
    "Free Elective Course",
    "Others",
  ];

  final List<DataRow> _rows = [];
  final List<String> _courseName = [];
  final List<String> _timeslots = [];
  final List<String> _courseId = [];
  final List<String> _courseCredit = [];
  final List<String> _courseType = [];

  List<String> get courseTypeIndex => _courseTypeIndex;
  List<DataRow> get rows => _rows;
  List<String> get coursename => _courseName;
  List<String> get courseId => _courseId;
  List<String> get timeslots => _timeslots;
  List<String> get courseCredit => _courseCredit;
  List<String> get courseType => _courseType;

  void addRow(DataRow newRow) {
    _rows.add(newRow);
    notifyListeners();
  }

  void removeRow(int index) {
    _rows.removeAt(index);
    notifyListeners();
  }

  void addCourse(
      String name, String id, String schedule, String credit, String type) {
    _courseName.add(name);
    _courseId.add(id);
    _timeslots.add(schedule);
    _courseCredit.add(credit);
    _courseType.add(type);
    notifyListeners();
  }

  void removeCourse(int index) {
    _courseName.removeAt(index);
    _courseId.removeAt(index);
    _timeslots.removeAt(index);
    _courseCredit.removeAt(index);
    _courseType.removeAt(index);
    notifyListeners();
  }
}

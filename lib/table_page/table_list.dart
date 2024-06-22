import 'package:chickychickyplanner/Provider/course_provider.dart';
import 'package:chickychickyplanner/table_page/new_row.dart';
import 'package:chickychickyplanner/Provider/overview_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
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

  final Uuid _uuid = Uuid();

  void _openAddRowOverlay(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      builder: (ctx) => NewRow(onAddRow: _addRow),
    );
  }

  void _addRow(
    String type,
    String courseName,
    String credit,
    String time,
  ) {
    setState(() {
      var typeInt = int.tryParse(type);
      var typeText = typeInt != null ? _courseTypeIndex[typeInt] : type;
      final courseProvider =
          Provider.of<CourseProvider>(context, listen: false);
      final tableProvider = Provider.of<TableProvider>(context, listen: false);
      final uniqueId = _uuid.v4();
      final newRow = DataRow(
        cells: [
          DataCell(
            Text(typeText, style: const TextStyle(fontSize: 13)),
          ),
          DataCell(
            Text(
              courseName,
              style: const TextStyle(fontSize: 13),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true,
            ),
          ),
          DataCell(
            Text(credit, style: const TextStyle(fontSize: 13)),
          ),
          DataCell(
            Text(time, style: const TextStyle(fontSize: 13)),
          ),
        ],
      );
      courseProvider.addRow(newRow);
      courseProvider.addCourseName(courseName);
      courseProvider.addCourseIndex(uniqueId);
      tableProvider.updateTable(courseName, time);
      courseProvider.addTime(time);
    });
  }

  void _removeRow(int index) {
    setState(() {
      final courseProvider =
          Provider.of<CourseProvider>(context, listen: false);
      final tableProvider = Provider.of<TableProvider>(context, listen: false);
      courseProvider.removeRow(index);
      courseProvider.removeCourseName(index);
      courseProvider.removeCourseIndex(index);
      tableProvider.updateTable('', courseProvider.timeslots[index]);
      courseProvider.removeTime(index);
      Navigator.of(context).pop();
    });
  }

  void _showOptionsDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deletion for Row ${index + 1}'),
          content: const Text('Do you want to remove this row?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _removeRow(index);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, courseProvider, _) {
        return Consumer<CourseProvider>(
          builder: (context, courseProvider, _) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowHeight: 60,
                        dataRowMaxHeight: double.infinity,
                        columnSpacing: 15,
                        showBottomBorder: true,
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Type',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Course Title',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Credits',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Time',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                        rows: courseProvider.rows
                            .asMap()
                            .entries
                            .map(
                              (entry) => DataRow(
                                cells: [
                                  for (var cell in entry.value.cells)
                                    DataCell(
                                      GestureDetector(
                                        onTap: () => _showOptionsDialog(
                                            context, entry.key),
                                        child: Flexible(
                                          child: cell.child,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _openAddRowOverlay(context),
                  icon: const Icon(Icons.add),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

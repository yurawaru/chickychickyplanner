import 'package:chickychickyplanner/checks_list_page/checklist_page.dart';
import 'package:chickychickyplanner/table_page/table_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:chickychickyplanner/service/navigation.dart';
import 'package:chickychickyplanner/timer_page/timer_page.dart';
import 'package:chickychickyplanner/chart_page/chart_page.dart';
import 'package:chickychickyplanner/ai_page/ai_page.dart';

enum HomeTab {
  table,
  checklist,
  timer,
  chart,
  ai,
}

class HomePage extends StatelessWidget {
  final HomeTab selectedTab;

  const HomePage({
    required this.selectedTab,
    super.key,
  });

  void _tapBottomNavigationBarItem(BuildContext context, int index) {
    final nav = Provider.of<NavigationService>(context, listen: false);
    switch (index) {
      case 0:
        nav.goHome(tab: HomeTab.table);
        break;
      case 1:
        nav.goHome(tab: HomeTab.checklist);
        break;
      case 2:
        nav.goHome(tab: HomeTab.timer);
        break;
      case 3:
        nav.goHome(tab: HomeTab.chart);
        break;
      case 4:
        nav.goHome(tab: HomeTab.ai);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {
        'page': const TablePage(),
        'title': 'Table Page',
      },
      {
        'page': const ChecklistPage(),
        'title': 'Checklist Page',
      },
      {
        'page': const TimerPage(),
        'title': 'Timer Page',
      },
      {
        'page': const ChartPage(),
        'title': 'Chart Page',
      },
      {
        'page': const AiPage(),
        'title': 'AI Page',
      },
    ];

    return Scaffold(
      body: tabs[selectedTab.index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _tapBottomNavigationBarItem(context, index),
        currentIndex: selectedTab.index,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Checklist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'AI',
          ),
        ],
      ),
    );
  }
}

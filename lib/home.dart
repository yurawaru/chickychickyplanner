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

class HomePage extends StatefulWidget {
  final HomeTab selectedTab;

  const HomePage({
    required this.selectedTab,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.selectedTab.index;
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _tapBottomNavigationBarItem(BuildContext context, int index) {
    final nav = Provider.of<NavigationService>(context, listen: false);
    nav.goHome(tab: HomeTab.values[index]);

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const TablePage(),
      const ChecklistPage(),
      const TimerPage(),
      const ChartPage(),
      const AiPage(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _tapBottomNavigationBarItem(context, index),
        currentIndex: _currentPage,
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

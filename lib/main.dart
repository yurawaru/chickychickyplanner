import 'package:chickychickyplanner/Provider/collections_provider.dart';
import 'package:chickychickyplanner/Provider/task_provider.dart';
import 'package:chickychickyplanner/Provider/overview_provider.dart';
import 'package:chickychickyplanner/Provider/timer_provider.dart';
import 'package:chickychickyplanner/home.dart';
import 'package:chickychickyplanner/start_page/no_tutorial_page.dart';
import 'package:chickychickyplanner/start_page/start_page.dart';
import 'package:chickychickyplanner/start_page/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chickychickyplanner/service/navigation.dart';
import 'Provider/course_provider.dart';
import 'Theme/theme.dart';
import 'Theme/util.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<NavigationService>(create: (_) => NavigationService()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (_) => TableProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
        ChangeNotifierProvider(create: (context) => ItemCollectionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final brightness = MediaQuery.of(context).platformBrightness;
        TextTheme textTheme = createTextTheme(context, "Mali", "Mali");
        MaterialTheme theme = MaterialTheme(textTheme);

        return MaterialApp(
          theme: brightness == Brightness.light ? theme.light() : theme.dark(),
          navigatorKey: navigatorKey,
          initialRoute: '/',
          routes: {
            '/': (context) => const StartPage(),
            '/no_tutorial': (context) => const NoTutorialPage(),
            '/tutorial': (context) => const TutorialPage(),
            '/table': (context) => const HomePage(
                  selectedTab: HomeTab.table,
                ),
            '/checklist': (context) => const HomePage(
                  selectedTab: HomeTab.checklist,
                ),
            '/timer': (context) => const HomePage(
                  selectedTab: HomeTab.timer,
                ),
            '/chart': (context) => const HomePage(
                  selectedTab: HomeTab.chart,
                ),
            '/ai': (context) => const HomePage(
                  selectedTab: HomeTab.ai,
                ),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
                builder: (_) => const HomePage(
                      selectedTab: HomeTab.table,
                    ));
          },
        );
      },
    );
  }
}
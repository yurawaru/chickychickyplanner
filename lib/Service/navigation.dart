import 'package:chickychickyplanner/main.dart';

import 'package:chickychickyplanner/home.dart';

class NavigationService {
  void goHome({required HomeTab tab}) {
    MyApp.navigatorKey.currentState!
        .pushNamed('/${tab.toString().split('.').last}');
  }
}

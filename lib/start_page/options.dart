import 'package:chickychickyplanner/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 350,
                  child: Text(
                    'First Time Using?',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    MyApp.navigatorKey.currentState!.pushNamed('/tutorial');
                  },
                  child: const Text('Started Tutorial'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    MyApp.navigatorKey.currentState!.pushNamed('/table');
                  },
                  child: const Text('Skip Tutorial'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




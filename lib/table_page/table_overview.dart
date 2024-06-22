import 'package:chickychickyplanner/Provider/overview_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  final List<String> specialPeriod = ['a', 'b', 'c'];
  final List<String> days = ['M', 'T', 'W', 'R', 'F', 'S', 'U'];

  @override
  Widget build(BuildContext context) {
    return Consumer<TableProvider>(builder: (context, tableProvider, _) {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: buildTable(context, tableProvider.dataTable),
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
              onPressed: () => _navigateToFullScreen(context),
              icon: const Icon(
                Icons.fullscreen,
                color: Colors.black,
              ),
            ),
          )
        ],
      );
    });
  }

  Widget buildTable(BuildContext context, List<List<String>> dataTable) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 100, height: 50),
                for (var day in days)
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.grey[200],
                    child: Center(child: Text(day)),
                  ),
              ],
            ),
            for (var i = 1; i < 13; i++)
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.grey[200],
                    child: Center(
                      child: i > 9 ? Text(specialPeriod[i - 10]) : Text('$i'),
                    ),
                  ),
                  for (var j = 0; j < 7; j++)
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          dataTable[i][j],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _navigateToFullScreen(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => const FullScreenOverview(),
      ),
    )
        .then((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    });
  }
}

class FullScreenOverview extends StatelessWidget {
  const FullScreenOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> specialPeriod = ['a', 'b', 'c'];
    final List<String> days = ['M', 'T', 'W', 'R', 'F', 'S', 'U'];
    final tableProvider = Provider.of<TableProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fullscreen View'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 100, height: 50),
                      for (var day in days)
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.grey[200],
                          child: Center(child: Text(day)),
                        ),
                    ],
                  ),
                  for (var i = 1; i < 13; i++)
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          color: Colors.grey[200],
                          child: Center(
                            child: i > 9
                                ? Text(specialPeriod[i - 10])
                                : Text('$i'),
                          ),
                        ),
                        for (var j = 0; j < 7; j++)
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                            ),
                            child: Center(
                              child: Text(
                                tableProvider.dataTable[i][j],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

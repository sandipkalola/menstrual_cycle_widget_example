import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget_example/display_widget.dart';

import 'custom_functions.dart';
import 'screens/graph/all_graph_screen.dart';
import 'screens/log_periods_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MenstrualCycleWidget.init(
      secretKey: "11a1215l0119a140409p0919", ivKey: "23a1dfr5lyhd9a1404845001");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ' View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final instance = MenstrualCycleWidget.instance!;

  @override
  void initState() {
    super.initState();
    instance.updateConfiguration(
        cycleLength: 31, periodDuration: 5, customerId: "1");
  }

  Widget getWidget({Widget? displayWidget, String? title}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                DisplayWidget(displayWidget: displayWidget, title: title),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Monthly Calender View
            getWidget(
                displayWidget: MenstrualCycleMonthlyCalenderView(
                  themeColor: Colors.black,
                  daySelectedColor: Colors.blue,
                  hideInfoView: false,
                  onDataChanged: (value) {},
                ),
                title: "Monthly Calender View"),
            //Calender View
            getWidget(
                displayWidget: Center(
                  child: MenstrualCycleCalenderView(
                    themeColor: Colors.black,
                    daySelectedColor: Colors.blue,
                    logPeriodText: "Log Period",
                    backgroundColorCode: Colors.white,
                    hideInfoView: false,
                    onDateSelected: (date) {},
                    onDataChanged: (value) {},
                    hideBottomBar: false,
                    hideLogPeriodButton: false,
                    isExpanded: false,
                  ),
                ),
                title: "Calender View"),
            // Menstrual Cycle Phase View
            getWidget(
                displayWidget: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: MenstrualCyclePhaseView(
                      size: 300,
                      theme: MenstrualCycleTheme.arcs,
                      phaseTextBoundaries: PhaseTextBoundaries.outside,
                      isRemoveBackgroundPhaseColor: true,
                      viewType: MenstrualCycleViewType.circleText,
                      spaceBtnTitleMessage: 5,
                      centralCircleSize: 100,
                      centralCircleBackgroundColor: Color(0xFFE1F5FE),
                      isAutoSetData: true,
                    ),
                  ),
                ),
                title: "Menstrual Cycle Phase View"),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0, color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                width: 150,
                child: const Center(
                  child: Text(
                    "Custom Functions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CustomFunctions(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0, color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                width: 150,
                child: const Center(
                  child: Text(
                    "Log Periods",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LogPeriodsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0, color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                width: 150,
                child: const Center(
                  child: Text(
                    "All Graph example",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AllGraphScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),

            /*GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0, color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                width: 150,
                child: const Center(
                  child: Text(
                    "Graph View",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LogPeriodsScreen(),
                  ),
                );
              },
            )*/
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

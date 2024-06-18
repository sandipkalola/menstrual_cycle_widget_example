import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_phase_view.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menstrual Cycle Phases View Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Menstrual Cycle Phases View'),
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: MenstrualCyclePhaseView(
                size: 300,
                totalCycleDays: 28,
                menstruationDayCount: 5,
                follicularDayCount: 7,
                selectedDay: 12,
                ovulationDayCount: 5,
               // imageAssets: "assets/img6.png",
                theme: MenstrualCycleTheme.arcs,
                phaseTextBoundaries: PhaseTextBoundaries.outside,
                isRemoveBackgroundPhaseColor: true,
                // centralCircleBackgroundColor: Colors.transparent,
                 viewType: MenstrualCycleViewType.text,
                // title: "Today 10th March",
               //arcStrokeWidth: 50,
                // message: "Best way to sex",
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

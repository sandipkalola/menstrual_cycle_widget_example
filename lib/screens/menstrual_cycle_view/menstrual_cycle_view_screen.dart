
import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

import '../../display_widget.dart';

class MenstrualCycleViewScreen extends StatelessWidget {
  const MenstrualCycleViewScreen({super.key});

  Widget textView(String title) {
    return Container(
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
      child: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Menstrual Cycle example",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: textView("MenstrualCycleTheme.basic"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DisplayWidget(
                        displayWidget: MenstrualCyclePhaseView(
                          size: 300,
                          theme: MenstrualCycleTheme.basic,
                          phaseTextBoundaries: PhaseTextBoundaries.outside,
                          isRemoveBackgroundPhaseColor: false,
                          viewType: MenstrualCycleViewType.text,
                          spaceBtnTitleMessage: 5,
                          centralCircleSize: 100,
                          centralCircleBackgroundColor: Color(0xFFE1F5FE),
                          isAutoSetData: true,
                        ),
                        title: "MenstrualCycleTheme.basic"),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("MenstrualCycleTheme.circle"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DisplayWidget(
                        displayWidget: MenstrualCyclePhaseView(
                          size: 300,
                          theme: MenstrualCycleTheme.circle,
                          phaseTextBoundaries: PhaseTextBoundaries.outside,
                          isRemoveBackgroundPhaseColor: false,
                          viewType: MenstrualCycleViewType.text,
                          spaceBtnTitleMessage: 5,
                          centralCircleSize: 100,
                          centralCircleBackgroundColor: Color(0xFFE1F5FE),
                          isAutoSetData: true,
                        ),
                        title: "MenstrualCycleTheme.circle"),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: textView("MenstrualCycleTheme.arcs"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DisplayWidget(
                        displayWidget: MenstrualCyclePhaseView(
                          size: 300,
                          theme: MenstrualCycleTheme.arcs,
                          phaseTextBoundaries: PhaseTextBoundaries.outside,
                          isRemoveBackgroundPhaseColor: false,
                          viewType: MenstrualCycleViewType.text,
                          spaceBtnTitleMessage: 5,
                          centralCircleSize: 100,
                          centralCircleBackgroundColor: Color(0xFFE1F5FE),
                          isAutoSetData: true,
                        ),
                        title: "MenstrualCycleTheme.arcs"),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

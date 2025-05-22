import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';

import '../../display_widget.dart';
import '../../util/custom_widgets.dart';

class MenstrualCycleViewScreen extends StatelessWidget {
  const MenstrualCycleViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Menstrual Cycle example"),
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
                    builder: (context) => DisplayWidget(
                        displayWidget: MenstrualCyclePhaseView(
                          size: 300,
                          theme: MenstrualCycleTheme.basic,
                          isRemoveBackgroundPhaseColor: false,
                          spaceBtnTitleMessage: 5,
                          centralCircleSize: 100,

                          onDayClick: (day, date1) {
                            printMenstrualCycleLogs("Selected Day $day $date1");
                          },
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
                    builder: (context) => DisplayWidget(
                        displayWidget: MenstrualCyclePhaseView(
                          size: 300,
                          theme: MenstrualCycleTheme.circle,
                          isRemoveBackgroundPhaseColor: false,
                          spaceBtnTitleMessage: 5,
                          centralCircleSize: 100,
                          onDayClick: (day, date1) {
                            printMenstrualCycleLogs("Selected Day $day $date1");
                          },
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
                    builder: (context) => DisplayWidget(
                        displayWidget: MenstrualCyclePhaseView(
                          size: 300,
                          theme: MenstrualCycleTheme.arcs,
                          spaceBtnTitleMessage: 5,
                          centralCircleSize: 100,
                          centralCircleBackgroundColor: Color(0xFFE1F5FE),
                          isAutoSetData: true,
                          onDayClick: (day, date1) {
                            printMenstrualCycleLogs("Selected Day $day $date1");

                          },
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

import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget_example/util/custom_widgets.dart';

class PeriodRangeList extends StatelessWidget {
  List<PeriodsDateRange>? periodDateRange;

  PeriodRangeList({super.key, this.periodDateRange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Period Range"),
      body: ListView.builder(
        itemCount: periodDateRange!.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Period Cycle : ${periodDateRange![index].id}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "Period Start Date: ${periodDateRange![index].periodStartDate}"),
                  Text(
                      "Period End Date: ${periodDateRange![index].periodEndDate}"),
                  Text(
                      "Period Duration: ${periodDateRange![index].periodDuration}"),
                  Text(
                      "Cycle Start Date: ${periodDateRange![index].cycleStartDate}"),
                  Text(
                      "Cycle End Date: ${periodDateRange![index].cycleEndDate}"),
                  Text(
                      "Cycle Duration: ${periodDateRange![index].cycleLength}"),
                  Text(
                      "Period Range: ${periodDateRange![index].allPeriodDates.toString()}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

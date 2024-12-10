import 'package:flutter/material.dart';
import 'package:menstrual_cycle_widget/menstrual_cycle_widget.dart';
import 'package:menstrual_cycle_widget_example/util/custom_widgets.dart';

class PeriodRangeList extends StatefulWidget {
  List<PeriodsDateRange>? periodDateRange;

  PeriodRangeList({super.key, this.periodDateRange});

  @override
  State<PeriodRangeList> createState() => _PeriodRangeListState();
}

class _PeriodRangeListState extends State<PeriodRangeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Period Range"),
      body: ListView.builder(
        itemCount: widget.periodDateRange!.length,
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
                    "Period Cycle : ${widget.periodDateRange![index].id}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "Period Start Date: ${widget.periodDateRange![index].periodStartDate}"),
                  Text(
                      "Period End Date: ${widget.periodDateRange![index].periodEndDate}"),
                  Text(
                      "Period Duration: ${widget.periodDateRange![index].periodDuration}"),
                  Text(
                      "Cycle Duration: ${widget.periodDateRange![index].cycleLength}"),
                  Text(
                      "Period Range: ${widget.periodDateRange![index].allPeriodDates.toString()}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

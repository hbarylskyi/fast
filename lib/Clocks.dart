import 'package:fast/FastSettingsState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Clocks extends StatelessWidget {
  late FastSettingsState state;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    state = context.read<FastSettingsState>();

    final fastStartHour = state.fastStart;
    final fastDuration = state.fastDuration;

    final fastStartTime = TimeOfDay(hour: fastStartHour, minute: 0);
    final fastEndTime =
        TimeOfDay(hour: fastStartHour + fastDuration, minute: 0);

    // final fastStartDate = DateTime(now.year, now.month, now.day, fastStartHour);
    // final fastEndDate = fastStartDate.add(Duration(hours: fastDuration));

      var startInAm = fastStartTime.period == DayPeriod.am;

      var dayClockStartAngle = fastStartTime.hour / 12;
    if (startInAm) {
    } else {

      var dayClockStartAngle = fastStartTime.hour / 12;
    }

    fastEndTime.hour;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 30.0,
          percent: 0.7,
          startAngle: 0,

          // center: new Text("100%"),
          backgroundColor: Colors.black.withOpacity(0.05),
          progressColor: Colors.black.withOpacity(0.7),
        ),
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 30.0,
          percent: 0.7,
          startAngle: 0,

          // center: new Text("100%"),
          backgroundColor: Colors.black.withOpacity(0.05),
          progressColor: Colors.black.withOpacity(0.7),
        ),
        // CircularProgressIndicator(value: 0.7, backgroundColor: Colors.black),
        // CircularProgressIndicator(value: 0.7, backgroundColor: Colors.black, ),
      ],
    );
  }
}

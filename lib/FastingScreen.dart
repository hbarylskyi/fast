import 'package:fast/FastSettingsState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Clocks.dart';

class FastingScreen extends StatelessWidget {
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

    final fastStartDate = DateTime(now.year, now.month, now.day, fastStartHour);
    final fastEndDate = fastStartDate.add(Duration(hours: fastDuration));

    final isFastingNow =
        now.isAfter(fastStartDate) && now.isBefore(fastEndDate);

    Duration timeLeft;

    if (isFastingNow) {
      timeLeft = now.difference(fastEndDate).abs();
    } else {
      timeLeft = now.difference(fastStartDate).abs();
    }

    final mins = timeLeft.inMinutes;
    final hours = timeLeft.inHours;
    final remainder = mins.remainder(60);
    final timeLeftString =
        hours.toString() + ":" + remainder.toString().padLeft(2, '0');

    // new Timer.periodic(Duration(seconds: 1), (Timer t) => setState((){}));

    bool didSwipeRight = context.read<FastSettingsState>().didSwipeRight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isFastingNow ? 'now: fasting' : 'now: eating',
                    style: TextStyle(fontSize: 30)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'your fasting time:\n' +
                        fastStartTime.format(context) +
                        ' - ' +
                        fastEndTime.format(context),
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center
                  ),
                ),
                // Clocks()
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!didSwipeRight)
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      color: Colors.amber,
                      child: SizedBox(
                          width: 130,
                          height: 100,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Swipe to change your fast settings ->',
                              textAlign: TextAlign.end,
                            ),
                          )),
                    ),
                  )
                else
                  Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FastingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final fastStartHour = 20;
    final fastHours = 16;

    final fastStartDate = DateTime(now.year, now.month, now.day, fastStartHour);
    final fastEndDate = fastStartDate.add(Duration(hours: fastHours));

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
    final timeLeftString = hours.toString() + ":" + remainder.toString();

    // new Timer.periodic(Duration(seconds: 1), (Timer t) => setState((){}));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              Column(
                children: [
                  // Text(fastStartDate.toString()),
                  // Text(now.isBefore(fastEndDate).toString()),
                  // Text(fastEndDate.toString()),
                  // Text(now.toString()),
                  Text(isFastingNow ? 'Fasting' : 'Eating',
                      style: TextStyle(fontSize: 30)),
                  Text(timeLeftString, style: TextStyle(fontSize: 20)),
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ),
    );
  }
}

import 'package:fast/FastSettingsState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CustomSlider.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SetupScreenState();
  }
}

class SetupScreenState extends State<SetupScreen> {
  @override
  Widget build(BuildContext context) {
    FastSettingsState state = context.watch<FastSettingsState>();
    double fastStart = state.fastStart.toDouble();
    double fastDuration = state.fastDuration.toDouble();

    print('fast start ' + fastStart.toString() + ' ' + fastDuration.toString());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  'what time should the fast start?',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const CustomSlider(
                height: 130,
                minValue: 0,
                maxValue: 24,
                defValue: 4,
                convertToTime: true
              ),

              Container(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  'how many hours should it last?',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const CustomSlider(
                height: 130,
                minValue: 1,
                maxValue: 23,
                defValue: 8,
              ),
            ]),
            // Positioned(
            //   bottom: 150,
            //   child: Consumer<FastSettingsState>(
            //     builder: (context, s, child) {
            //       return AnimatedOpacity(
            //         duration: const Duration(seconds: 2),
            //         opacity: s.didSwipeRight ? 0 : 1,
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(12.0),
            //               child: SizedBox(
            //                 height: 100,
            //                 child: Container(
            //                     color: Colors.amber,
            //                     alignment: Alignment.center,
            //                     child: Text('palosanto')),
            //               ),
            //             )
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ));
  }
}

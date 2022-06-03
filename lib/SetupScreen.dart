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
              CustomSlider(
                  height: 130,
                  minValue: 0,
                  maxValue: 24,
                  defValue: state.fastStart,
                  convertToTime: true,
                  onChanged: (_fastStart) {
                    state.fastStart = _fastStart;
                  }),
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
              CustomSlider(
                  height: 130,
                  minValue: 1,
                  maxValue: 23,
                  defValue: state.fastDuration,
                  onChanged: (_fastDuration) {
                    state.fastDuration = _fastDuration;
                  }),
            ]),
          ],
        ));
  }
}

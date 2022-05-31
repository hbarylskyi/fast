import 'package:flutter/material.dart';

class StatefulSlider extends StatefulWidget {
  final Function(double) onChanged;
  final double val;

  const StatefulSlider({Key? key, required this.onChanged, required this.val})
      : super(key: key);

  @override
  State<StatefulSlider> createState() {
    return StatefulSliderState();
  }
}

class StatefulSliderState extends State<StatefulSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        overlappingShapeStrokeColor: Colors.transparent,
          trackHeight: 80,

          thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 0, disabledThumbRadius: 0,)),
      child: Slider(
        activeColor: Colors.black,
        inactiveColor: Colors.white,
        max: 24,
        divisions: 24,
        label: widget.val.toString(),
        onChanged: widget.onChanged,
        value: widget.val,
      ),
    );
  }
}

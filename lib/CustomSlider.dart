import 'dart:ui';

import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final FocusNode? focusNode;

  final int maxValue;
  final int minValue;
  final int defValue;
  final int height;
  final bool convertToTime;

  const CustomSlider(
      {Key? key,
      this.focusNode,
      required this.minValue,
      required this.maxValue,
      required this.defValue,
      required this.height,
      this.convertToTime = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomSliderState();
  }
}

class CustomSliderState extends State<CustomSlider>
    with TickerProviderStateMixin {
  late int value;

  // focusNode prevents PageView from intercepting focus
  FocusNode? _focusNode;
  FocusNode get focusNode => widget.focusNode ?? _focusNode!;
  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    value = widget.defValue;

    if (widget.focusNode == null) {
      // Only create a new node if the widget doesn't have one.
      _focusNode ??= FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _renderSlider();
  }

  Widget _renderSlider() {
    int calcValue(details) {
      int widgetWidth = _key.currentContext!.size!.width.toInt();
      var percentage = (details.localPosition.dx / widgetWidth);
      var v = widget.maxValue * percentage;
      value = v.toInt();

      if (value < widget.minValue) {
        return widget.minValue;
      } else if (value > widget.maxValue) {
        return widget.maxValue;
      }

      return value;
    }

    String text = value.toString();

    if (widget.convertToTime) {
      var time = TimeOfDay(hour: value, minute: 0);

      text = time.format(context);

      if (!MediaQuery.of(context).alwaysUse24HourFormat) {
        text = text.replaceAll(':00', '');
      }
    }

    return GestureDetector(
      key: _key,
      onTapDown: (details) {
        value = calcValue(details);
        setState(() {});
      },
      onHorizontalDragStart: (details) {
        value = calcValue(details);
        setState(() {});
      },
      onHorizontalDragUpdate: (details) {
        value = calcValue(details);
        setState(() {});
      },
      child: Stack(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: widget.height * 0.5),
          ),
          SizedBox(
            height: widget.height.toDouble(),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: value,
                  child: Container(
                    color: Colors.black.withOpacity(0),
                    child: ClipRect(
                      child: BackdropFilter(
                          filter: const ColorFilter.matrix([
                            -1, 0, 0, 0, 255, // inverts colors under the filter
                            0, -1, 0, 0, 255, //
                            0, 0, -1, 0, 255, //
                            0, 0, 0, 1, 0, //
                          ]),
                          child: Container(

                          )),
                    ),
                  ),
                ),
                Flexible(
                  flex: widget.maxValue - value,
                  child: Container(
                    color: Colors.black.withOpacity(0.05),
                  ),
                ),
                // Flexible(
                //   flex: widget.maxValue - value,
                //   child: Container(
                //     color: Colors.black.withOpacity(0.3),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

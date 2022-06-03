import 'package:flutter/material.dart';

/// Custom Slider widget for special visual purposes of this app

class CustomSlider extends StatefulWidget {
  final FocusNode? focusNode;

  final int maxValue;
  final int minValue;
  final int defValue;
  final int height;
  final bool convertToTime;
  final void Function(int) onChanged;

  const CustomSlider(
      {Key? key,
      this.focusNode,
      required this.minValue,
      required this.maxValue,
      required this.defValue,
      required this.height,
      this.convertToTime = false,
      required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomSliderState();
  }
}

class CustomSliderState extends State<CustomSlider>
    with TickerProviderStateMixin {
  late int _value;

  // focusNode prevents PageView from intercepting focus
  FocusNode? _focusNode;
  FocusNode get focusNode => widget.focusNode ?? _focusNode!;
  final _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    _value = widget.defValue;

    if (widget.focusNode == null) {
      // Only create a new node if the widget doesn't have one.
      _focusNode ??= FocusNode();
    }
  }

  int calcSliderValue(details) {
    int widgetWidth = _key.currentContext!.size!.width.toInt();
    var percentage = (details.localPosition.dx / widgetWidth);
    var newValue = (widget.maxValue * percentage).toInt();

    if (newValue < widget.minValue) {
      return widget.minValue;
    } else if (newValue > widget.maxValue) {
      return widget.maxValue;
    }

    return newValue;
  }

  processNewValue(newVal) {
    if (_value != newVal) {
      widget.onChanged(newVal);
    }

    _value = newVal;
  }

  @override
  Widget build(BuildContext context) {
    String text = _value.toString();

    if (widget.convertToTime) {
      var time = TimeOfDay(hour: _value, minute: 0);

      text = time.format(context);

      if (!MediaQuery.of(context).alwaysUse24HourFormat) {
        text = text.replaceAll(':00', '');
      }
    }

    return GestureDetector(
      key: _key,
      onTapDown: (details) {
        processNewValue(calcSliderValue(details));
        setState(() {});
      },
      onHorizontalDragStart: (details) {
        processNewValue(calcSliderValue(details));
        setState(() {});
      },
      onHorizontalDragUpdate: (details) {
        processNewValue(calcSliderValue(details));
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
                  flex: _value,
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
                          child: Container()),
                    ),
                  ),
                ),
                Flexible(
                  flex: widget.maxValue - _value,
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

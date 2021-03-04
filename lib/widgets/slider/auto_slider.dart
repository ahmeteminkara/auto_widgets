import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoSlider extends StatelessWidget {
  final double value;
  final Function(double value) onChange;
  final String title;
  final double min;
  final double max;
  final Color? color;
  final int? divisions;

  const AutoSlider({
    required this.value,
    required this.onChange,
    this.title = "",
    this.min = 0,
    this.max = 100,
    this.color,
    this.divisions,
  })  :
        assert(min >= 0 && min < max),
        assert(divisions == null || (divisions >= min && divisions <= max));

  @override
  Widget build(BuildContext context) {
    final android = SliderTheme(
        data: SliderTheme.of(context).copyWith(
          inactiveTrackColor: Colors.grey[300],
          activeTrackColor: color != null ? color!.withAlpha(140) : null,
          trackHeight: 4.0,
          thumbColor: color ?? null,
          overlayColor: color != null ? color!.withAlpha(30) : null,
          valueIndicatorColor: color ?? null,
          valueIndicatorTextStyle: TextStyle(fontSize: 18),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          showValueIndicator: ShowValueIndicator.always,
        ),
        child: _android);
    return Tools.isAndroid ? android : _ios;
  }

  get _ios => CupertinoSlider(
        min: min,
        max: max,
        value: value,
        onChanged: onChange,
        activeColor: color ?? null,
        divisions: divisions ?? null,
      );

  get _android => Slider(
        min: min,
        max: max,
        value: value,
        onChanged: onChange,
        label: value.toStringAsFixed(0),
        divisions: divisions ?? null,
      );
}

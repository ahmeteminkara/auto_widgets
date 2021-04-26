import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoToggle extends StatelessWidget {
  final bool value;
  final Function(bool status) onChange;
  final String title;

  final Color color;

  const AutoToggle({
    @required this.value,
    @required this.onChange,
    @required this.title,
    this.color,
  })  : assert(value != null),
        assert(onChange != null);

  @override
  Widget build(BuildContext context) {
    final styleTrue = color ?? null;
    final styleFalse = color != null ? color.withAlpha(130) : null;
    return TextButton.icon(
      icon: Icon(value ? Icons.check_box : Icons.check_box_outline_blank),
      label: Text(title),
      onPressed: () => onChange(!value),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(value ? styleTrue : styleFalse),
      ),
      //activeColor: color ?? null,
      //checkColor: color != null ? color.withAlpha(100) : null,
    );
  }
}

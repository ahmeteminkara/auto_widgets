import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoSwitch extends StatelessWidget {
  final bool value;
  final Function(bool status) onChange;
  final String title;

  final Color? color;

  const AutoSwitch({
    required this.value,
    required this.onChange,
    this.title = "",
    this.color,
  }) ;

  @override
  Widget build(BuildContext context) {
    final _switch = Tools.isAndroid
        ? Switch(
            value: value,
            onChanged: onChange,
            activeColor: color ?? null,
            activeTrackColor: color != null ? color!.withAlpha(100) : null,
          )
        : CupertinoSwitch(
            activeColor: color ?? null,
            trackColor: color != null ? color!.withAlpha(100) : null,
            value: value,
            onChanged: onChange,
          );

    if (title.isNotEmpty) {
      return ListTile(
        onTap: () => onChange(!value),
        trailing: _switch,
        title: Text(title),
      );
    }
    return _switch;
  }
}

import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoSwitch extends StatelessWidget {
  final bool value;
  final Function(bool status) onChange;
  final String title;

  const AutoSwitch({
    @required this.value,
    @required this.onChange,
    this.title = "",
  })  : assert(value != null),
        assert(onChange != null);

  @override
  Widget build(BuildContext context) {
    final _switch = Tools.isAndroid
        ? Switch(
            value: value,
            onChanged: onChange,
          )
        : CupertinoSwitch(
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

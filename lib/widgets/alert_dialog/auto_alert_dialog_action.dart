import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_widgets/widgets/tools.dart';

class AutoAlertDialogAction extends StatelessWidget {
  final String title;
  final bool isCancel;
  final Function onPressed;

  AutoAlertDialogAction({
    @required this.title,
    @required this.onPressed,
    this.isCancel = false,
  })  : assert(title != null && title.isNotEmpty),
        assert(onPressed != null);

  static  defaultAction(String text) => AutoAlertDialogAction(title: text, onPressed: () {});

  @override
  Widget build(BuildContext context) {
    Color color = isCancel ? Colors.red : Theme.of(context).buttonTheme.colorScheme.primary;

    return Tools.isAndroid
        ? TextButton(
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(color)),
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
            child: Text(title))
        : CupertinoDialogAction(
            child: Text(title),
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
            isDestructiveAction: isCancel,
          );
  }
}

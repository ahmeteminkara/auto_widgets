import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_widgets/widgets/tools.dart';

class AutoAlertDialogAction extends StatelessWidget {
  final String title;
  final bool isCancel;
  final Function onPressed;

  AutoAlertDialogAction({
    required this.title,
    required this.onPressed,
    this.isCancel = false,
  }) : assert(title.isNotEmpty);

  static get defaultAction => AutoAlertDialogAction(title: "Tamam", onPressed: () {});

  @override
  Widget build(BuildContext context) {
    Color color = isCancel ? Colors.red : Theme.of(context).primaryColor;

    return Tools.isAndroid
        ? TextButton(
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
            child: Text(title),
            style: TextButton.styleFrom(
              backgroundColor: color,
            ),
          )
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

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AutoContextMenuAction extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function onPressed;

  AutoContextMenuAction({
    required this.title,
    required this.onPressed,
    this.icon,
  })  : assert( title.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenuAction(
      trailingIcon: icon != null ? icon : null,
      child: Text(title),
      onPressed: () {
        Navigator.pop(context);
        onPressed();
      },
    );
  }
}

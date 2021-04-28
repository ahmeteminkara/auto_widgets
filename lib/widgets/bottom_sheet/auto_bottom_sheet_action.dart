import 'dart:async';

import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AutoBottomSheetAction extends StatelessWidget {
  final String title;
  final Function onPressed;

  AutoBottomSheetAction({
    @required this.title,
    @required this.onPressed,
  })  : assert(title != null && title.isNotEmpty),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    final onClick = () {
      Navigator.pop(context);
      Timer(Duration(milliseconds: 100), () {
        onPressed();
      });
    };

    return Tools.isAndroid
        ? ListTile(title: new Text(title), onTap: onClick)
        : CupertinoActionSheetAction(child: Text(title), onPressed: onClick);
  }
}

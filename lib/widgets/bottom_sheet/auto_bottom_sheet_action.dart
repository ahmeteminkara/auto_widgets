import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AutoBottomSheetAction extends StatelessWidget {
  final String title;
  final bool isCancel;
  final Function onPressed;

  AutoBottomSheetAction({
    @required this.title,
    @required this.onPressed,
    this.isCancel = false,
  })  : assert(title != null && title.isNotEmpty),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    if (Tools.isAndroid && isCancel) return Container();

    return Tools.isAndroid
        ? ListTile(
            title: new Text(title),
            onTap: () {
              Navigator.pop(context);
              onPressed();
            },
          )
        : CupertinoActionSheetAction(
            child: Text(title),
            isDestructiveAction: isCancel,
            onPressed: () {
              Navigator.pop(context);
              onPressed();
            },
          );
  }
}

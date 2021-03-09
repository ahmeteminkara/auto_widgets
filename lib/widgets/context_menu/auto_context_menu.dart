import 'package:auto_widgets/widgets/context_menu/auto_context_menu_action.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoContextMenu extends StatelessWidget {
  double width;
  double height;
  final Widget _child;
  final List<AutoContextMenuAction> _actions;

  AutoContextMenu({
    this.width = 0,
    this.height = 0,
    @required Widget child,
    @required List<AutoContextMenuAction> actions,
  })  : assert(child != null),
        assert(actions != null),
        assert(actions.length > 0),
        _child = child,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    if (width == 0) width = MediaQuery.of(context).size.width * .8;
    if (height == 0) height = MediaQuery.of(context).size.width * .8;

    if (width < 50) width = 50;
    if (height < 50) height = 50;

    return CupertinoContextMenu(
      previewBuilder: (context, animation, child) => Container(
        width: width,
        height: height,
        child: child,
      ),
      child: _child,
      actions: _actions.map((e) => e).toList(),
    );
  }
}

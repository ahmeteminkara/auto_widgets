import 'package:auto_widgets/widgets/context_menu/auto_context_menu_action.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoContextMenu extends StatelessWidget {
  final double _width;
  final double _height;
  final Widget _child;
  final List<AutoContextMenuAction> _actions;

  AutoContextMenu({
    @required double width,
    @required double height,
    @required Widget child,
    @required List<AutoContextMenuAction> actions,
  })  : assert(child != null),
        assert(actions != null),
        assert(actions.length > 0),
        assert(width > 0 && height > 0),
        _width = width,
        _height = height,
        _child = child,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      child: CupertinoContextMenu(
        //previewBuilder: (context, animation, child) => Container(child: child),
        child: _child,
        actions: _actions.map((e) => e).toList(),
      ),
    );
  }
}

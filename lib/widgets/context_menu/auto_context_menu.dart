import 'package:auto_widgets/widgets/context_menu/auto_context_menu_action.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoContextMenu extends StatelessWidget {
  double _width;
  double _height;
  final Widget _child;
  final List<AutoContextMenuAction> _actions;

  AutoContextMenu({
    double width = 0,
    double height = 0,
    @required Widget child,
    @required List<AutoContextMenuAction> actions,
  })  : assert(child != null),
        assert(actions != null),
        assert(actions.length > 0),
        _child = child,
        _actions = actions {
    _width = width;
    _height = height;
  }

  @override
  Widget build(BuildContext context) {
    if (_width == 0) _width = MediaQuery.of(context).size.width * 0.9;
    if (_height == 0) _height = MediaQuery.of(context).size.width * 0.9;

    if (_width < 50) _width = 50;
    if (_height < 50) _height = 50;

    return CupertinoContextMenu(
      previewBuilder: (context, animation, child) => Container(
        width: _width,
        height: _height,
        child: child,
      ),
      child: _child,
      actions: _actions.map((e) => e).toList(),
    );
  }
}

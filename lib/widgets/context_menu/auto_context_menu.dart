import 'package:auto_widgets/widgets/context_menu/auto_context_menu_action.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PreviewSize {
  Small,
  Medium,
  Large,
}

class AutoContextMenu extends StatelessWidget {
  final double width;
  final double height;
  final Widget _child;
  final List<AutoContextMenuAction> _actions;
  final PreviewSize previewSize;

  AutoContextMenu({
    this.width = 0,
    this.height = 0,
    @required this.previewSize,
    @required Widget child,
    @required List<AutoContextMenuAction> actions,
  })  : assert(child != null),
        assert(actions != null),
        assert(actions.length > 0),
        _child = child,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    double _width;
    double _height;

    switch (previewSize) {
      case PreviewSize.Large:
        _width = MediaQuery.of(context).size.width * .9;
        _height = MediaQuery.of(context).size.width * .9;
        break;
      case PreviewSize.Medium:
        _width = MediaQuery.of(context).size.width * .6;
        _height = MediaQuery.of(context).size.width * .6;
        break;
      default:
        _width = MediaQuery.of(context).size.width * .3;
        _height = MediaQuery.of(context).size.width * .3;
        break;
    }

    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Theme.of(context).brightness,
      ),
      child: CupertinoContextMenu(
        previewBuilder: (context, animation, child) => Center(
          child: Container(
            width: _width,
            height: _height,
            child: child,
          ),
        ),
        child: _child,
        actions: _actions.map((e) => e).toList(),
      ),
    );
  }
}

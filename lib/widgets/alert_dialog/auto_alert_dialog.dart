import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_widgets/widgets/tools.dart';
import 'auto_alert_dialog_action.dart';

class AutoAlertDialog {
  final BuildContext _context;
  final String _title;
  final String _message;
  final bool _barrierDismissible;
  final List<AutoAlertDialogAction> _actions;
  final String defaultButtonText;

  List<AutoAlertDialogAction> _showedActions = [];
  AutoAlertDialogAction _actionCancel;

  AutoAlertDialog({
    @required BuildContext context,
    @required String message,
    @required this.defaultButtonText,
    List<AutoAlertDialogAction> actions,
    String title,
    bool barrierDismissible = true,
  })  : assert(context != null),
        assert(message != null),
        _context = context,
        _message = message,
        _title = title ?? "",
        _barrierDismissible = barrierDismissible,
        _actions = actions ?? [AutoAlertDialogAction.defaultAction(defaultButtonText)];

  get _android {
    return AlertDialog(
      title: _title.isNotEmpty ? Text(_title) : null,
      content: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: ListBody(children: <Widget>[Text(_message)]),
      ),
      actions: _showedActions.map((e) => e).toList(),
    );
  }

  get _ios {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Theme.of(_context).brightness,
      ),
      child: CupertinoAlertDialog(
        title: _title.isNotEmpty ? Text(_title) : null,
        content: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: ListBody(children: <Widget>[Text(_message)]),
        ),
        actions: _showedActions.map((e) => e).toList(),
      ),
    );
  }

  void show() {
    for (var btn in _actions) {
      if (btn.isCancel) {
        _actionCancel = btn;
      } else {
        _showedActions.add(btn);
      }
    }
    if (_actionCancel != null) _showedActions.add(_actionCancel);

    Tools.isAndroid
        ? showDialog(
            context: _context,
            barrierDismissible: _barrierDismissible,
            builder: (context) => _android,
          )
        : showCupertinoDialog(
            context: _context,
            barrierDismissible: _barrierDismissible,
            builder: (context) => _ios,
          );
  }
}

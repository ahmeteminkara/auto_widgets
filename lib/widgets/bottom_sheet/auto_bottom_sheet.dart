import 'package:auto_widgets/widgets/bottom_sheet/auto_bottom_sheet_action.dart';
import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoBottomSheet {
  final BuildContext _context;
  final String _title;
  final String _message;
  final List<AutoBottomSheetAction> _actions;

  List<AutoBottomSheetAction> _showedActions = List();
  AutoBottomSheetAction _actionCancel;

  AutoBottomSheet({
    @required BuildContext context,
    @required String message,
    String title,
    List<AutoBottomSheetAction> actions,
  })  : assert(context != null),
        assert(message != null),
        assert(actions != null && actions.length >= 2),
        _context = context,
        _message = message,
        _title = title ?? "",
        _actions = actions;

  _android() {
    List<Widget> tempList = List();
    tempList.add(ListTile(
      title: _title.isNotEmpty ? Text(_title, style: TextStyle(fontWeight: FontWeight.w500)) : null,
      subtitle: Text(_message, style: TextStyle(fontWeight: FontWeight.w300)),
    ));

    _showedActions.forEach((e) => tempList.add(e));

    print("showedActions.length: ${_showedActions.length}");
    print("tempList.length: ${tempList.length}");

    return showModalBottomSheet(
        context: _context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: tempList.map((e) => e).toList(),
            ),
          );
        });
  }

  get _ios {
    showCupertinoModalPopup(
      context: _context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: _title.isNotEmpty ? Text(_title) : null,
        message: Text(_message),
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

    Tools.isAndroid ? _android() : _ios();
  }
}

import 'package:auto_widgets/widgets/bottom_sheet/auto_bottom_sheet_action.dart';
import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoBottomSheet {
  final BuildContext _context;
  final String _title;
  final String _message;
  final List<AutoBottomSheetAction> _actions;

  AutoBottomSheet({
    required BuildContext context,
    required String message,
    String title = "",
    List<AutoBottomSheetAction> actions = const [],
  })  : assert(
            actions.length >= 2 && actions.length <= 4, "Hi, actions length must be min 2, max 4. Use 'AutoSelectMenu' as an alternative"),
        _context = context,
        _message = message,
        _title = title,
        _actions = actions;

  _android() {
    List<Widget> tempList = [];
    tempList.add(ListTile(
      title: _title.isNotEmpty ? Text(_title, style: TextStyle(fontWeight: FontWeight.w500)) : null,
      subtitle: Text(_message, style: TextStyle(fontWeight: FontWeight.w300)),
    ));

    _actions.forEach((e) => tempList.add(e));

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
    List<Widget> tempList = [];
    _actions.forEach((e) => tempList.add(e));
    tempList.add(CupertinoActionSheetAction(
      child: Text("Vazgeç"),
      isDestructiveAction: true,
      isDefaultAction: true,
      onPressed: () => Navigator.pop(_context),
    ));

    showCupertinoModalPopup(
      context: _context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: _title.isNotEmpty ? Text(_title) : null,
        message: Text(_message),
        actions: tempList.map((e) => e).toList(),
      ),
    );
  }

  void show() {
    Tools.isAndroid ? _android() : _ios();
  }
}

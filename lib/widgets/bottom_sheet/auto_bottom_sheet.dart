import 'package:auto_widgets/widgets/bottom_sheet/auto_bottom_sheet_action.dart';
import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoBottomSheet {
  final BuildContext _context;
  final String _title;
  final String _message;
  final List<AutoBottomSheetAction> _actions;
  final String iosCancelText;

  AutoBottomSheet({
    @required BuildContext context,
    @required String message,
    @required this.iosCancelText,
    String title,
    List<AutoBottomSheetAction> actions,
  })  : assert(context != null),
        assert(message != null),
        assert(actions != null),
        _context = context,
        _message = message,
        _title = title ?? "",
        _actions = actions;

  _android() {
    List<Widget> tempList = [];

    tempList.add(
      ListTile(
        title: _title.isNotEmpty ? Text(_title, style: TextStyle(fontWeight: FontWeight.w500)) : null,
        subtitle: Text(_message, style: TextStyle(fontWeight: FontWeight.w300)),
      ),
    );
    tempList.add(Divider(height: 0));

    _actions.forEach((e) => tempList.add(e));

    return showModalBottomSheet(
        context: _context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return ConstrainedBox(
            constraints: new BoxConstraints(maxHeight: MediaQuery.of(_context).size.height * 0.6),
            child: Container(
              color: Theme.of(_context).scaffoldBackgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: tempList.map((e) => e).toList(),
                ),
              ),
            ),
          );
        });
  }

  _ios() {
    List<Widget> tempList = [];
    _actions.forEach((e) => tempList.add(e));

    if (iosCancelText != null && iosCancelText.isNotEmpty) {
      tempList.add(CupertinoActionSheetAction(
        child: Text(iosCancelText),
        isDestructiveAction: true,
        isDefaultAction: true,
        onPressed: () => Navigator.pop(_context),
      ));
    }

    if (tempList.isEmpty) return;

    showCupertinoModalPopup(
      context: _context,
      builder: (BuildContext context) => CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Theme.of(_context).brightness,
        ),
        child: CupertinoActionSheet(
          title: _title.isNotEmpty ? Text(_title) : null,
          message: Text(_message),
          actions: tempList.map((e) => e).toList(),
        ),
      ),
    );
  }

  void show() {
    Tools.isAndroid ? _android() : _ios();
  }
}

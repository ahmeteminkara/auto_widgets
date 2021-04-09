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
    @required BuildContext context,
    @required String message,
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

    _actions.forEach((e) => tempList.add(e));

    return showModalBottomSheet(
        context: _context,
        builder: (BuildContext bc) {
          return Container(
            child: Column(
              children: [
                ListTile(
                  title: _title.isNotEmpty ? Text(_title, style: TextStyle(fontWeight: FontWeight.w500)) : null,
                  subtitle: Text(_message, style: TextStyle(fontWeight: FontWeight.w300)),
                ),
                Divider(height: 0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: tempList.map((e) => e).toList(),
                    ),
                  ),
                ),
              ],
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

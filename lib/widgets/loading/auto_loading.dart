import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoLoading {
  final BuildContext _context;
  final String _message;

  AutoLoading({
    @required BuildContext context,
    @required String message,
  })  : assert(context != null),
        assert(message != null),
        assert(message.length > 5 && message.length < 20),
        _context = context,
        _message = message;

  void show() {
    final b = (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: _ui,
        ));

    Tools.isAndroid
        ? showDialog(
            context: _context,
            barrierDismissible: false,
            builder: b,
          )
        : showCupertinoDialog(
            context: _context,
            barrierDismissible: false,
            builder: b,
          );
  }

  get _ui => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          tileColor: Colors.transparent,
          leading: Tools.isAndroid ? CircularProgressIndicator(strokeWidth: 2) : CupertinoActivityIndicator(radius: 13),
          title: Text(_message),
        ),
      );
}

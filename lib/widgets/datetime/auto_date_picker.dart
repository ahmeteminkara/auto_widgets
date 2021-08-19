import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_widgets/widgets/tools.dart';

class AutoDatePicker {
  final BuildContext _context;
  final Function(DateTime dateTime) _onChange;
  DateTime _currentDate;
  DateTime _minDate;
  DateTime _maxDate;

  AutoDatePicker({
    @required BuildContext context,
    @required Function(DateTime dateTime) onChange,
    @required DateTime currentDate,
    DateTime minDate,
    DateTime maxDate,
  })  : assert(context != null),
        assert(onChange != null),
        _context = context,
        _onChange = onChange {
    final now = DateTime.now();

    _currentDate = currentDate ?? now;
    _minDate = minDate ?? DateTime(now.year - 20);
    _maxDate = maxDate ?? DateTime(now.year + 20);

    //print("_minDate: $_minDate");
    //print("_current: $_currentDate");
    //print("_maxDate: $_maxDate");

    // başlangıç zamanı şimdiki zamandan sonra(after) ise başlangıcı şimdiki zamana eşitle
    if (_minDate.isAfter(_currentDate)) {
      _minDate = _currentDate;
      //print("başlangıç zamanı şimdiki zamandan sonra(after)");
    }
    // şimdiki zaman bitiş zamandan sonra(after) ise şimdiki zamanı bitiş zamana eşitle
    if (_currentDate.isAfter(_maxDate)) {
      _currentDate = _maxDate;
      //print("şimdiki zaman bitiş zamandan sonra(after)");
    }
  }

  _android() async {
    final DateTime picked = await showDatePicker(
      context: _context,
      initialDate: _currentDate,
      firstDate: _minDate,
      lastDate: _maxDate,
    );

    _onChange(picked);
  }

  _ios() {
    showModalBottomSheet(
        context: _context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(_context).copyWith().size.height * .4,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                brightness: Theme.of(_context).brightness,
              ),
              child: CupertinoDatePicker(
                minimumDate: _minDate,
                initialDateTime: _currentDate,
                maximumDate: _maxDate,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime dateTime) {
                  _onChange(dateTime);
                },
              ),
            ),
          );
        });
  }

  void show() {
    Tools.isAndroid ? _android() : _ios();
  }
}

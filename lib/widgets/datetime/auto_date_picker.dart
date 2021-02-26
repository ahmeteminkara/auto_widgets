import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_widgets/widgets/tools.dart';

class AutoDatePicker {
  final BuildContext _context;
  final Function(DateTime dateTime) _onChange;
  DateTime _currentDateTime;
  DateTime _minDateTime;
  DateTime _maxDateTime;

  AutoDatePicker({
    @required BuildContext context,
    @required Function(DateTime dateTime) onChange,
    @required DateTime currentDateTime,
    DateTime minDateTime,
    DateTime maxDateTime,
  })  : assert(context != null),
        assert(onChange != null),
        _context = context,
        _onChange = onChange {
    final now = DateTime.now();

    _currentDateTime = currentDateTime ?? now;
    _minDateTime = minDateTime ?? now;
    _maxDateTime = maxDateTime ?? DateTime(now.year + 20);

    print("_minDate: $_minDateTime");
    print("_current: $_currentDateTime");
    print("_maxDate: $_maxDateTime");

    // başlangıç zamanı şimdiki zamandan sonra(after) ise başlangıcı şimdiki zamana eşitle
    if (_minDateTime.isAfter(_currentDateTime)) {
      _minDateTime = _currentDateTime;
      print("başlangıç zamanı şimdiki zamandan sonra(after)");
    }
    // şimdiki zaman bitiş zamandan sonra(after) ise şimdiki zamanı bitiş zamana eşitle
    if (_currentDateTime.isAfter(_maxDateTime)) {
      _currentDateTime = _maxDateTime;
      print("şimdiki zaman bitiş zamandan sonra(after)");
    }

    show();
  }

  _android() async {
    final DateTime picked = await showDatePicker(
      context: _context,
      initialDate: _currentDateTime,
      firstDate: _minDateTime,
      lastDate: _maxDateTime,
    );

    _onChange(picked);
  }

  _ios() {
    showModalBottomSheet(
        context: _context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(_context).copyWith().size.height * .4,
            color: Colors.white,
            child: CupertinoDatePicker(
              minimumDate: _minDateTime,
              initialDateTime: _currentDateTime,
              maximumDate: _maxDateTime,
              minuteInterval: 1,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime dateTime) {
                _onChange(dateTime);
              },
            ),
          );
        });
  }

  void show() {
    Tools.isAndroid ? _android() : _ios();
  }
}

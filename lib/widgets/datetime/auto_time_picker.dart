import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_widgets/widgets/tools.dart';

class AutoTime extends TimeOfDay {
  final int _hour;
  final int _minute;

  AutoTime(int hour, int minute)
      : _hour = hour,
        _minute = minute;

  static now() {
    DateTime timeNow = DateTime.now();

    return AutoTime(timeNow.hour, timeNow.minute);
  }

  toTimeOfDay() => TimeOfDay(hour: _hour, minute: _minute);
  toDuration() => Duration(hours: _hour, minutes: _minute);

  @override
  String toString() {
    return (_hour < 10 ? "0" : "") + "$_hour:" + (_minute < 10 ? "0" : "") + "$_minute";
  }
}

class AutoTimePicker {
  final BuildContext _context;
  final Function(AutoTime time) _onChange;
  AutoTime _currentTime;

  AutoTimePicker({
    @required BuildContext context,
    @required Function(AutoTime autoTime) onChange,
    @required AutoTime currentTime,
  })  : assert(context != null),
        assert(onChange != null),
        _context = context,
        _onChange = onChange {
    final now = AutoTime.now();

    _currentTime = currentTime ?? now;

    print("currentTime: $_currentTime");

    show();
  }

  _android() async {
    final TimeOfDay picked = await showTimePicker(
      context: _context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: _currentTime.toTimeOfDay(),
    );
    if (picked != null) _onChange(AutoTime(picked.hour, picked.minute));
  }

  _ios() {
    showModalBottomSheet(
        context: _context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(_context).copyWith().size.height * .4,
            color: Colors.white,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              minuteInterval: 1,
              secondInterval: 1,
              onTimerDurationChanged: (v) {
                _onChange(AutoTime(v.inHours, v.inMinutes - (v.inHours * 60)));
              },
              initialTimerDuration: _currentTime.toDuration(),
            ),
          );
        });
  }

  void show() {
    Tools.isAndroid ? _android() : _ios();
  }
}

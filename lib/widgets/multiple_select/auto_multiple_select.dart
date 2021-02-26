import 'dart:async';

import 'package:auto_widgets/widgets/multiple_select/auto_multiple_select_widget.dart';
import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoMultipleSelect {
  final BuildContext _context;
  final List<String> _items;
  final List<String> selected;
  final Function(List<String>) onSelect;
  

  AutoMultipleSelect({
    @required BuildContext context,
    @required this.selected,
    @required this.onSelect,
    @required List<String> items,
  })  : assert(context != null),
        assert(onSelect != null),
        assert(items != null),
        assert(items.length >= 1, "Hi, items length must be min 1"),
        _context = context,
        _items = items;

  void show() {
    showModalBottomSheet(
        context: _context,
        builder: (BuildContext bc) {
          return AutoMultipleSelectWidget(_context, _items, selected, onSelect);
        });
  }
}

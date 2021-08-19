import 'package:auto_widgets/widgets/multiple_select/auto_multiple_select_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoMultipleSelect {
  final BuildContext _context;
  final List<String> _items;
  final List<String> selected;
  final Function(List<String> selectedList) onSelect;

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
    if(_items.isEmpty)return;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: _context,
        elevation: 0,
        builder: (BuildContext bc) {
          return AutoMultipleSelectWidget(_context, _items, selected, onSelect);
        });
  }
}

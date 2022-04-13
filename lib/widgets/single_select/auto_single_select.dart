import 'dart:async';

import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoSingleSelect {
  final BuildContext _context;
  final List<String> _items;
  final String _selected;
  final Function(String selected) _onSelect;

  final ValueNotifier<String> _selectedListOneItem = ValueNotifier("");

  AutoSingleSelect({
    @required BuildContext context,
    @required String selected,
    @required Function(String selected) onSelect,
    @required List<String> items,
  })  : assert(context != null),
        assert(onSelect != null),
        assert(items != null),
        assert(items.length >= 1, "Hi, items length must be min 1"),
        _context = context,
        _items = items,
        _selected = selected,
        _onSelect = onSelect;

  _android(int index) {
    if (_items.isEmpty) return;
    final _controller = ScrollController();
    final _height = 60.0;

    List<Widget> listTiles = [];

    /// TODO: seçili gelsin diye ekledim test etmedim
    _selectedListOneItem.value = _selected;
    
    for (var i = 0; i < _items.length; i++) {
      String title = _items.elementAt(i);

      listTiles.add(Container(
        height: _height,
        child: ValueListenableBuilder(
            valueListenable: _selectedListOneItem,
            builder: (context, value, child) {
              return ListTile(
                leading: value == title
                    ? Icon(Icons.radio_button_checked, color: Theme.of(_context).primaryColor)
                    : Icon(Icons.radio_button_off, color: Colors.grey),
                title: Text(title, style: TextStyle(fontWeight: value == title ? FontWeight.w800 : FontWeight.w400)),
                onTap: () {
                  _selectedListOneItem.value = title;
                  //_onClick(title);
                },
              );
            }),
      ));
    }

    Timer(Duration(milliseconds: 100), () {
      _controller.animateTo(_height * index, duration: Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn);
    });

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: _context,
        builder: (BuildContext bc) {
          return ConstrainedBox(
            constraints: new BoxConstraints(maxHeight: MediaQuery.of(_context).size.height * 0.6),
            child: Container(
              color: Theme.of(_context).scaffoldBackgroundColor,
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: listTiles.map((e) => e).toList(),
                ),
              ),
            ),
          );
        }).then((value) => _onClick(_selectedListOneItem.value));
  }

  _ios(index) {
    if (_items.isEmpty) return;
    showCupertinoModalPopup(
      context: _context,
      builder: (_) => Container(
        height: 200,
        child: CupertinoTheme(
          data: CupertinoThemeData(
            brightness: Theme.of(_context).brightness,
          ),
          child: CupertinoPicker(
            backgroundColor: Theme.of(_context).cardColor,
            itemExtent: 60,
            scrollController: FixedExtentScrollController(initialItem: index ?? 0),
            children: _items.map((e) => Center(child: Text(e))).toList(),
            onSelectedItemChanged: (i) {
              _selectedListOneItem.value = _items.elementAt(i);
              //_onClick(_items.elementAt(i));
            },
          ),
        ),
      ),
    ).then((value) => _onClick(_selectedListOneItem.value));
  }

  _onClick(s) => Timer(Duration(milliseconds: 100), () {
        _onSelect(s);
      });

  void show() {
    int index = -1;
    if (_selected != null && _selected.isNotEmpty) index = _items.indexOf(_selected);

    Tools.isAndroid ? _android(index) : _ios(index);
  }
}

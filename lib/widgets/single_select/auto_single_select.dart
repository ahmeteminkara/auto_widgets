import 'dart:async';

import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoSingleSelect {
  final BuildContext _context;
  final List<String> _items;
  final String _selected;
  final Function(String selected) _onSelect;

  AutoSingleSelect({
    @required BuildContext context,
    @required String selected,
    @required Function(String selected) onSelect,
    @required List<String> items,
  })  : assert(context != null),
        assert(onSelect != null),
        assert(items != null),
        assert(items.length >= 2, "Hi, items length must be min 2"),
        _context = context,
        _items = items,
        _selected = selected,
        _onSelect = onSelect;

  _android(int index) {
    final _controller = ScrollController();
    final _height = 60.0;

    List<Widget> listTiles = [];

    for (var i = 0; i < _items.length; i++) {
      String title = _items.elementAt(i);

      listTiles.add(Container(
        height: _height,
        child: ListTile(
          leading: i == index
              ? Icon(Icons.radio_button_checked, color: Theme.of(_context).primaryColor)
              : Icon(Icons.radio_button_off, color: Colors.grey),
          title: Text(title, style: TextStyle(fontWeight: i == index ? FontWeight.w800 : FontWeight.w400)),
          onTap: () => _onClick(title),
        ),
      ));
    }

    Timer(Duration(milliseconds: 100), () {
      _controller.animateTo(_height * index, duration: Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn);
    });

    showModalBottomSheet(
        context: _context,
        builder: (BuildContext bc) {
          return Container(
            height: _height40,
            child: ListView(
              controller: _controller,
              children: listTiles.map((e) => e).toList(),
            ),
          );
        });
  }

  get _height40 => MediaQuery.of(_context).size.height * .4;

  _ios(index) {
    showCupertinoModalPopup(
        context: _context,
        builder: (_) => Container(
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 60,
                scrollController: FixedExtentScrollController(initialItem: index ?? 0),
                children: _items.map((e) => Center(child: Text(e))).toList(),
                onSelectedItemChanged: (i) => _onClick(_items.elementAt(i)),
              ),
            ));
  }

  _onClick(s) => Timer(Duration(milliseconds: 100), () {
        if (Tools.isAndroid) Navigator.pop(_context);
        _onSelect(s);
      });

  void show() {
    int index = -1;
    if (_selected != null && _selected.isNotEmpty) index = _items.indexOf(_selected);

    Tools.isAndroid ? _android(index) : _ios(index);
  }
}

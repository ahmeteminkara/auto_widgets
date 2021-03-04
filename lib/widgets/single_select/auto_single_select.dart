import 'dart:async';

import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoSingleSelect {
  final BuildContext _context;
  final List<String> _items;
  final String selected;
  final Function(String selected) onSelect;

  AutoSingleSelect({
    required BuildContext context,
    required this.selected,
    required this.onSelect,
    required List<String> items,
  })   : assert(items.length >= 2, "Hi, items length must be min 2"),
        _context = context,
        _items = items;

  _android(int index) {
    final _controller = ScrollController();
    final _height = 55.0;

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
            height: _height50,
            child: ListView(
              controller: _controller,
              children: listTiles.map((e) => e).toList(),
            ),
          );
        });
  }

  get _height50 => MediaQuery.of(_context).size.height * .5;

  _ios(index) {
    showCupertinoModalPopup(
        context: _context,
        builder: (_) => Container(
              height: 250,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 50,
                scrollController: FixedExtentScrollController(initialItem: index ?? 0),
                children: _items.map((e) => Center(child: Text(e))).toList(),
                onSelectedItemChanged: (i) => _onClick(_items.elementAt(i)),
              ),
            ));
  }

  _onClick(s) => Timer(Duration(milliseconds: 100), () {
        if (Tools.isAndroid) Navigator.pop(_context);
        onSelect(s);
      });

  void show() {
    int index = -1;
    if (selected != null && selected.isNotEmpty) index = _items.indexOf(selected);

    Tools.isAndroid ? _android(index) : _ios(index);
  }
}

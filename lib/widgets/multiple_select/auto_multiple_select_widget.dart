
import 'package:auto_widgets/widgets/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoMultipleSelectWidget extends StatefulWidget {
  final BuildContext context;
  final List<String> items;
  final List<String> selected;
  final Function(List<String> selectedList) onSelect;

  AutoMultipleSelectWidget(this.context, this.items, this.selected, this.onSelect);

  @override
  _AutoMultipleSelectWidgetState createState() => _AutoMultipleSelectWidgetState();
}

class _AutoMultipleSelectWidgetState extends State<AutoMultipleSelectWidget> {
  List<Widget> listTiles = [];
  List<String> selected = [];

  @override
  void initState() {
    super.initState();
    selected.clear();
    selected.addAll(widget.selected);

    buildUI();
  }

  @override
  Widget build(BuildContext context) {
    final w = Container(
      height: _height50,
      child: ListView.separated(
        itemCount: listTiles.length,
        itemBuilder: (context, index) => listTiles.elementAt(index),
        separatorBuilder: (context, index) => Divider(height: 1),
      ),
    );

    if (Tools.isAndroid) return w;

    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      child: w,
    );
  }

  buildUI() {
    listTiles.clear();

    for (var i = 0; i < widget.items.length; i++) {
      String title = widget.items.elementAt(i);
      setState(() {
        listTiles.add(Container(
          child: ListTile(
            leading: Tools.isAndroid ? _androidWidget(title) : null,
            trailing: !Tools.isAndroid ? _iosWidget(title) : null,
            title: Text(title),
            onTap: () => _onClick(title),
          ),
        ));
      });
    }
  }

  _androidWidget(String title) {
    return Checkbox(
        value: selected.contains(title),
        onChanged: (s) {
          setState(() {});
          _onClick(title);
        });
  }

  _iosWidget(String title) {
    return CupertinoSwitch(
        value: selected.contains(title),
        onChanged: (s) {
          setState(() {});
          _onClick(title);
        });
  }

  get _height50 => MediaQuery.of(widget.context).size.height * (Tools.isAndroid ? .5 : .4);

  _onClick(String title) {
    setState(() {
      if (selected.contains(title)) {
        selected.remove(title);
      } else {
        selected.add(title);
      }
      print("selected: $selected");
      widget.onSelect(selected);
    });
    buildUI();
  }
}

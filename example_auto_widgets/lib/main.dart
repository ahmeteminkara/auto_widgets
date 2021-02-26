import 'dart:async';

import 'package:auto_widgets/auto_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoWidgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('tr'),
        const Locale('en'),
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration initialtimer = Duration();
  String selected;
  List<String> selectedList = [];
  bool status = false;
  DateTime currentDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AutoWidget Plugin"), centerTitle: true),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _imageContextMenu,
            _list,
          ],
        ),
      ),
    );
  }

  get _imageContextMenu {
    final image = AutoContextMenu(
      width: 110,
      height: 100,
      child: Image.network(
        'https://avatars.githubusercontent.com/u/43777229',
        fit: BoxFit.cover,
      ),
      actions: [
        AutoContextMenuAction(title: "Değiştir", icon: CupertinoIcons.repeat, onPressed: () {}),
        AutoContextMenuAction(title: "Kaldır", icon: CupertinoIcons.delete_simple, onPressed: () {}),
      ],
    );

    return Container(
      width: MediaQuery.of(context).size.width * .8,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(20),
        child: Row(
          children: [image, Expanded(child: Center(child: Text("Ahmet Emin KARA")))],
        ),
      ),
    );
  }

  get _list {
    List<Widget> btnList = [
      OutlinedButton(
        child: Text("AutoAlertDialog"),
        onPressed: () {
          AutoAlertDialog(
            context: context,
            message: "AutoAlertDialog Message",
            title: "AutoAlertDialog Title",
            barrierDismissible: false,
            actions: [
              AutoAlertDialogAction(title: "Evet", onPressed: () {}),
              AutoAlertDialogAction(title: "Hayır", onPressed: () {}, isCancel: true),
            ],
          ).show();
        },
      ),
      OutlinedButton(
        child: Text("AutoAlertDialog Default"),
        onPressed: () {
          AutoAlertDialog(
            context: context,
            message: "Default Button",
            title: "AutoAlertDialog Message",
            barrierDismissible: false,
          ).show();
        },
      ),
      OutlinedButton(
        child: Text("AutoBottomSheet"),
        onPressed: () {
          AutoBottomSheet(context: context, message: "AutoBottomSheet", title: "AutoAlertDialog Title", actions: [
            AutoBottomSheetAction(title: "Seçenek 1", onPressed: () {}),
            AutoBottomSheetAction(title: "Seçenek 2", onPressed: () {}),
            AutoBottomSheetAction(title: "Seçenek 3", onPressed: () {}),
          ]).show();
        },
      ),
      OutlinedButton(
        child: Text("AutoLoading"),
        onPressed: () {
          AutoLoading(context: context, message: "AutoLoading").show();
          Timer(Duration(seconds: 6), () => Navigator.pop(context));
        },
      ),
      OutlinedButton(
        child: Text(selected ?? "AutoSelectMenu"),
        onPressed: () {
          AutoSingleSelect(
              context: context,
              selected: selected,
              items: List.generate(10, (i) => "Item $i"),
              onSelect: (s) {
                setState(() => selected = s);
              }).show();
        },
      ),
      OutlinedButton(
        child: Text("AutoMultipleSelect ${selectedList.length}"),
        onPressed: () {
          AutoMultipleSelect(
              context: context,
              selected: selectedList,
              items: List.generate(10, (i) => "Config item $i"),
              onSelect: (s) {
                setState(() => selectedList = s);
              }).show();
        },
      ),
      Center(
          child: AutoSwitch(
        value: status,
        color: Colors.red,
        onChange: (s) => setState(() => status = s),
      )),
      AutoSwitch(
        value: status,
        color: Colors.deepPurple,
        onChange: (s) => setState(() => status = s),
        title: "Switch Title",
      ),
      OutlinedButton(
        child: Text(currentDateTime == null ? "AutoDatePicker" : currentDateTime.toString()),
        onPressed: () {
          //DateTime now = DateTime.now(); // current time
          //DateTime open = DateTime(now.year, now.month, now.day - 1);

          AutoDatePicker(
            context: context,
            currentDateTime: currentDateTime,
            //minDateTime: open,
            onChange: (dateTime) {
              setState(() {
                currentDateTime = dateTime;
              });
            },
          );
        },
      ),
    ];

    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 40),
        children: btnList.map((e) => e).toList(),
      ),
    );
  }
}

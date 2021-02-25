import 'dart:async';

import 'package:auto_widgets/auto_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AutoWidget Plugin"), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _imageContextMenu,
          _list,
        ],
      ),
    );
  }

  get _imageContextMenu {
    return AutoContextMenu(
      width: 200,
      height: 200,
      child: Image.network(
        'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
        fit: BoxFit.cover,
      ),
      actions: [
        AutoContextMenuAction(title: "Değiştir", icon: CupertinoIcons.repeat, onPressed: () {}),
        AutoContextMenuAction(title: "Kaldır", icon: CupertinoIcons.delete_simple, onPressed: () {}),
      ],
    );
  }

  get _list {
    List<Widget> btnList = [
      OutlineButton(
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
      OutlineButton(
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
      OutlineButton(
        child: Text("AutoBottomSheet"),
        onPressed: () {
          AutoBottomSheet(context: context, message: "AutoBottomSheet", title: "AutoAlertDialog Title", actions: [
            AutoBottomSheetAction(title: "Seçenek 1", onPressed: () {}),
            AutoBottomSheetAction(title: "Seçenek 2", onPressed: () {}),
            AutoBottomSheetAction(title: "Seçenek 3", onPressed: () {}),
          ]).show();
        },
      ),
      OutlineButton(
        child: Text("AutoLoading"),
        onPressed: () {
          AutoLoading(context: context, message: "AutoLoading").show();
          Timer(Duration(seconds: 6), () => Navigator.pop(context));
        },
      ),
    ];

    return Expanded(
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: btnList.map((e) => e).toList(),
      ),
    );
  }
}

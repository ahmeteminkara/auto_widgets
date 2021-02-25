import 'dart:async';

import 'package:auto_widgets/auto_widgets.dart';
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
      body: _list,
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
            message: "AutoAlertDialog Message",
            title: "AutoAlertDialog Title",
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
            AutoBottomSheetAction(title: "İptal", onPressed: () {}, isCancel: true),
          ]).show();
        },
      ),
      OutlineButton(
        child: Text("AutoBottomSheet"),
        onPressed: () {
          AutoLoading(context: context, message: "AutoBottomSheet").show();
          Timer(Duration(seconds: 6), () => Navigator.pop(context));
        },
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: btnList.map((e) => e).toList(),
      ),
    );
  }
}

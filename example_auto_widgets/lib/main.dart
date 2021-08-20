// ignore_for_file: close_sinks

import 'dart:async';

import 'package:auto_widgets/auto_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'themes/theme_dark.dart';
import 'themes/theme_light.dart';

void main() {
  runApp(MyApp());
}

class ThemeControl {
  static Stream<bool> get isDarkTheme => isDarkThemeController.stream;
  static final isDarkThemeController = StreamController<bool>.broadcast();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ThemeControl.isDarkTheme,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return MaterialApp(
            title: 'AutoWidgets',
            theme: snapshot.data ? themeDark : themeLight,
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
        });
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
  DateTime currentDate;
  AutoTime currentTime;
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AutoWidget Plugin"), centerTitle: true),
      body: Container(
        child: Column(
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
      previewSize: PreviewSize.Large,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Image.network(
          'https://avatars.githubusercontent.com/u/43777229',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
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
          children: [
            image,
            Expanded(
                child: Center(
              child: Text("Ahmet Emin KARA"),
            ))
          ],
        ),
      ),
    );
  }

  _icon(IconData icon, String s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [Icon(icon), Text(s)],
      ),
    );
  }

  get _list {
    List<Widget> btnList = [
      _icon(AppIcons.addUsers, "addUsers"),
      _icon(AppIcons.users, "users"),
      _icon(AppIcons.myFolder, "myFolder"),
      _icon(AppIcons.files, "files"),
      _icon(AppIcons.setting, "setting"),
      OutlinedButton(
        child: Text(currentTime == null ? "AutoTimePicker" : currentTime.toString()),
        onPressed: () {
          AutoTimePicker(
            context: context,
            currentTime: currentTime,
            onChange: (time) {
              print(time.toString());
              setState(() {
                currentTime = time;
              });
            },
          );
        },
      ),
      OutlinedButton(
        child: Text("AutoAlertDialog"),
        onPressed: () {
          AutoAlertDialog(
            context: context,
            message: "AutoAlertDialog Message",
            title: "AutoAlertDialog Title",
            barrierDismissible: false,
            defaultButtonText: "Hayır",
            actions: [
              AutoAlertDialogAction(title: "Evet", onPressed: () {}),
              AutoAlertDialogAction(title: "Hayır", onPressed: () {}, isCancel: true),
            ],
          ).show();
        },
      ),
      TextButton(
        child: Text("AutoAlertDialog Default"),
        onPressed: () {
          AutoAlertDialog(
            context: context,
            message: "Default Button",
            title: "AutoAlertDialog Message",
            barrierDismissible: false,
            defaultButtonText: "Defalut Button Text",
          ).show();
        },
      ),
      OutlinedButton(
        child: Text("AutoBottomSheet"),
        onPressed: () {
          AutoBottomSheet(
            context: context,
            message: "AutoBottomSheet",
            title: "AutoAlertDialog Title",
            iosCancelText: "Kapat",
            actions: List.generate(8, (index) => AutoBottomSheetAction(title: "Item $index", onPressed: () {})),
          ).show();
        },
      ),
      OutlinedButton(
        child: Text("AutoLoading"),
        onPressed: () {
          AutoLoading(context: context, message: "AutoLoading").show();
          Timer(Duration(seconds: 2), () => Navigator.pop(context));
        },
      ),
      OutlinedButton(
        child: Text(selected ?? "AutoSelectMenu"),
        onPressed: () {
          AutoSingleSelect(
              context: context,
              selected: selected,
              items: List.generate(13, (i) => "Item $i"),
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
              items: List.generate(4, (i) => "Config item $i"),
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
      StreamBuilder(
        stream: ThemeControl.isDarkTheme,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return AutoSwitch(
            value: snapshot.data,
            onChange: (s) {
              ThemeControl.isDarkThemeController.add(s);
            },
            title: snapshot.data ? "Dark" : "Light",
          );
        },
      ),
      AutoSwitch(
        value: status,
        color: Colors.deepPurple,
        onChange: (s) => setState(() => status = s),
        title: "Switch Title",
      ),
      AutoToggle(
        value: status,
        color: Colors.deepOrange,
        onChange: (s) => setState(() => status = s),
        title: "Toggle Title",
      ),
      OutlinedButton(
        child: Text(currentDate == null ? "AutoDatePicker" : currentDate.toString()),
        onPressed: () {
          //DateTime now = DateTime.now(); // current time
          //DateTime open = DateTime(now.year, now.month, now.day - 1);

          AutoDatePicker(
            context: context,
            currentDate: currentDate,
            //minDateTime: open,
            onChange: (dateTime) {
              setState(() {
                currentDate = dateTime;
              });
            },
          );
        },
      ),
      AutoSlider(
          value: sliderValue,
          color: Colors.deepOrange,
          onChange: (value) {
            setState(() => sliderValue = value);
          }),
      AutoSlider(
          value: sliderValue,
          color: Colors.deepPurple,
          divisions: 10,
          onChange: (value) {
            setState(() => sliderValue = value);
          }),
    ];

    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(20),
        children: btnList.map((e) => Container(child: e)).toList(),
      ),
    );
  }
}

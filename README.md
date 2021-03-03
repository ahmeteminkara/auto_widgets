# Auto Widgets

This Flutter plugin automatically shows native components


## Getting Started
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations: # add line
    sdk: flutter # add line

    auto_widgets:
        git:
            url: git://github.com/ahmeteminkara/auto_widgets.git
```
```dart

import 'package:auto_widgets/auto_widgets.dart';
// for the local language of month names
import 'package:flutter_localizations/flutter_localizations.dart';


MaterialApp(
    localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
    ],
)
```


## AutoContextMenu
<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/01-context-menu-android.gif" width="140" /></kbd> <kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/01-context-menu-ios.gif" width="140" /></kbd> 


## AutoTimePicker
<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/02-time-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/02-time-ios.gif" width="140" /></kbd> 


## AutoAlertDialog
<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/03-alert-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/03-alert-ios.gif" width="140" /></kbd> 


## AutoAlertDialog (Defalut action)
<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/04-alert-default-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/04-alert-default-ios.gif" width="140" /></kbd> 


## AutoBottomSheet
<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/05-option-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/05-option-ios.gif" width="140" /></kbd> 


## AutoLoading
<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/06-loading-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/06-loading-ios.gif" width="140" /></kbd> 


## AutoSelectMenu
<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/07-single-select-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/07-single-select-ios.gif" width="140" /></kbd> 


## AutoMultipleSelect

<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/08-multiple-select-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/08-multiple-select-ios.gif" width="140" /></kbd> 


## AutoSwitch

<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/09-switch-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/09-switch-ios.gif" width="140" /></kbd> 


## AutoDatePicker

<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/10-date-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/10-date-ios.gif" width="140" /></kbd> 



## AutoSlider

<kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/11-slider-android.gif" width="140" /></kbd><kbd><img src="https://raw.githubusercontent.com/ahmeteminkara/auto_widgets/main/gif/11-slider-ios.gif" width="140" /></kbd> 
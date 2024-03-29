import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBuilder {
  IconData _android;
  IconData _iOS;

  IconBuilder({@required IconData android, @required IconData iOS}) {
    _android = android;
    _iOS = iOS;
  }

  IconData get toGenerate => Platform.isAndroid ? _android : _iOS;
}

class AppIcons {
  /// <i class="material-icons-round md-36">add</i> &#x2014; <i class='cupertino-icons md-36'>plus</i> &#x2014; .
  static IconData get add => IconBuilder(android: Icons.add_rounded, iOS: CupertinoIcons.add).toGenerate;

  /// <i class="material-icons md-36">add_circle_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>add_circled_solid</i> &#x2014; .
  static IconData get addCircle => IconBuilder(android: Icons.add_circle_rounded, iOS: CupertinoIcons.add_circled_solid).toGenerate;

  /// <i class="material-icons md-36">add_circle_outline_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>add_circled</i> &#x2014; .
  static IconData get addCircleOutline => IconBuilder(android: Icons.add_circle_outline_rounded, iOS: CupertinoIcons.add_circled).toGenerate;

  /// <i class="material-icons md-36">settings_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>settings</i> &#x2014; .
  static IconData get setting => IconBuilder(android: Icons.settings_rounded, iOS: CupertinoIcons.settings).toGenerate;

  /// <i class="material-icons md-36">close_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>xmark</i> &#x2014; .
  static IconData get close => IconBuilder(android: Icons.close_rounded, iOS: CupertinoIcons.xmark).toGenerate;

  /// <i class="material-icons md-36">backspace_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>delete_left_fill</i> &#x2014; .
  static IconData get backspace => IconBuilder(android: Icons.backspace_rounded, iOS: CupertinoIcons.delete_left_fill).toGenerate;

  /// <i class="material-icons md-36">chat_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>text_bubble_fill</i> &#x2014; .
  static IconData get comment => IconBuilder(android: Icons.chat_rounded, iOS: CupertinoIcons.text_bubble_fill).toGenerate;

  /// <i class="material-icons md-36">widgets_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>square_grid_2x2_fill</i> &#x2014; .
  static IconData get boxes => IconBuilder(android: Icons.widgets_rounded, iOS: CupertinoIcons.square_grid_2x2_fill).toGenerate;

  /// <i class="material-icons md-36">http_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>globe</i> &#x2014; .
  static IconData get http => IconBuilder(android: Icons.http_rounded, iOS: CupertinoIcons.globe).toGenerate;

  /// <i class="material-icons md-36">delete_rounded</i> &#x2014; <i class='cupertino-icons md-36'>delete_simple</i> &#x2014; .
  static IconData get delete => IconBuilder(android: Icons.delete_rounded, iOS: CupertinoIcons.delete_simple).toGenerate;

  /// <i class="material-icons md-36">login_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>square_arrow_right</i> &#x2014; .
  static IconData get login => IconBuilder(android: Icons.login_rounded, iOS: CupertinoIcons.square_arrow_right).toGenerate;

  /// <i class="material-icons md-36">logout_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>square_arrow_left</i> &#x2014; .
  static IconData get logout => IconBuilder(android: Icons.logout_rounded, iOS: CupertinoIcons.square_arrow_left).toGenerate;

  /// <i class="material-icons md-36">info_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>info_circle_fill</i> &#x2014; .
  static IconData get info => IconBuilder(android: Icons.info_rounded, iOS: CupertinoIcons.info_circle_fill).toGenerate;

  /// <i class="material-icons md-36">more_time</i> &#x2014;  <i class='cupertino-icons md-36'>time</i> &#x2014; .
  static IconData get addTime => IconBuilder(android: Icons.more_time_rounded, iOS: CupertinoIcons.time_solid).toGenerate;

  /// <i class="material-icons md-36">person_add_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>person_badge_plus_fill</i> &#x2014; .
  static IconData get addUsers => IconBuilder(android: Icons.person_add_rounded, iOS: CupertinoIcons.person_badge_plus_fill).toGenerate;

  /// <i class="material-icons md-36">beach_access_rounded</i> &#x2014; <i class='cupertino-icons md-36'>sun_haze_fill</i> &#x2014; .
  static IconData get beach => IconBuilder(android: Icons.beach_access_rounded, iOS: CupertinoIcons.sun_haze_fill).toGenerate;

  /// <i class="material-icons md-36">date_range_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>calendar_today</i> &#x2014; .
  static IconData get calendar => IconBuilder(android: Icons.date_range_rounded, iOS: CupertinoIcons.calendar_today).toGenerate;

  /// <i class="material-icons md-36">done_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>checkmark</i> &#x2014; .
  static IconData get check => IconBuilder(android: Icons.done_rounded, iOS: CupertinoIcons.checkmark).toGenerate;

  /// <i class="material-icons md-36">check_circle_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>check_mark_circled_solid</i> &#x2014; .
  static IconData get checkCircle => IconBuilder(android: Icons.check_circle_rounded, iOS: CupertinoIcons.check_mark_circled_solid).toGenerate;

  /// <i class="material-icons md-36">check_circle_outline_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>check_mark_circled</i> &#x2014; .
  static IconData get checkCircleOutline =>
      IconBuilder(android: Icons.check_circle_outline_rounded, iOS: CupertinoIcons.check_mark_circled).toGenerate;

  /// <i class="material-icons md-36">rule_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>text_badge_checkmark</i> &#x2014; .
  static IconData get checkList => IconBuilder(android: Icons.rule_rounded, iOS: CupertinoIcons.text_badge_checkmark).toGenerate;

  /// <i class="material-icons md-36">folder_shared_rounded</i> &#x2014; <i class='cupertino-icons md-36'>folder_fill_badge_person_crop</i> &#x2014; .
  static IconData get myFolder =>
      IconBuilder(android: Icons.folder_shared_rounded, iOS: CupertinoIcons.folder_fill_badge_person_crop).toGenerate;

  /// <i class="material-icons md-36">favorite_rounded</i> &#x2014; <i class='cupertino-icons md-36'>heart_fill</i> &#x2014; .
  static IconData get heart => IconBuilder(android: Icons.favorite_rounded, iOS: CupertinoIcons.heart_fill).toGenerate;

  /// <i class="material-icons-rounded md-36">qr_code</i> &#x2014; <i class='cupertino-icons md-36'>qrcode</i> &#x2014; .
  static IconData get qrCode => IconBuilder(android: Icons.qr_code_rounded, iOS: CupertinoIcons.qrcode).toGenerate;

  /// <i class="material-icons-rounded md-36">description</i> &#x2014; <i class='cupertino-icons md-36'>doc_text</i> &#x2014; .
  static IconData get files => IconBuilder(android: Icons.description_rounded, iOS: CupertinoIcons.doc_text_fill).toGenerate;

  /// <i class="material-icons md-36">receipt_long_rounded</i> &#x2014; <i class='cupertino-icons md-36'>square_list</i> &#x2014; .
  static IconData get tasks => IconBuilder(android: Icons.receipt_long_rounded, iOS: CupertinoIcons.square_list).toGenerate;

  /// <i class="material-icons-round md-36">access_time</i> &#x2014;  <i class='cupertino-icons md-36'>time</i> &#x2014; .
  static IconData get time => IconBuilder(android: Icons.access_time_rounded, iOS: CupertinoIcons.time).toGenerate;

  /// <i class="material-icons md-36">person</i> &#x2014; <i class='cupertino-icons md-36'>person_alt_circle</i> &#x2014; .
  static IconData get user => IconBuilder(android: Icons.person_rounded, iOS: CupertinoIcons.person_alt_circle).toGenerate;

  /// <i class="material-icons md-36">group_rounded</i> &#x2014;  <i class='cupertino-icons md-36'>person_2_fill</i> &#x2014; .
  static IconData get users => IconBuilder(android: Icons.group_rounded, iOS: CupertinoIcons.person_2_fill).toGenerate;

  /// <i class="material-icons-round md-36">business</i> &#x2014;  <i class='cupertino-icons md-36'>building_2_fill</i> &#x2014; .
  static IconData get company => IconBuilder(android: Icons.business_rounded, iOS: CupertinoIcons.building_2_fill).toGenerate;

  /// <i class="material-icons md-36">forum_rounded</i> &#x2014; <i class='cupertino-icons md-36'>chat_bubble_2_fill</i> &#x2014; .
  static IconData get chat => IconBuilder(android: Icons.forum_rounded, iOS: CupertinoIcons.chat_bubble_2_fill).toGenerate;

  /// <i class="material-icons md-36">arrow_back_rounded</i> &#x2014;  <i class="material-icons md-36">chevron_left</i> &#x2014;  .
  static IconData get arrowLeft => IconBuilder(android: Icons.arrow_back_rounded, iOS: Icons.chevron_left).toGenerate;

  /// <i class="material-icons md-36">arrow_forward_rounded</i> &#x2014; <i class="material-icons md-36">chevron_right</i> &#x2014; .
  static IconData get arrowRight => IconBuilder(android: Icons.arrow_forward_rounded, iOS: Icons.chevron_right).toGenerate;

  /// <i class="material-icons md-36">arrow_upward_rounded</i> &#x2014; <i class="material-icons md-36">expand_less</i> &#x2014; .
  static IconData get arrowUp => IconBuilder(android: Icons.arrow_upward_rounded, iOS: Icons.expand_less).toGenerate;

  /// <i class="material-icons md-36">arrow_downward_rounded</i> &#x2014; <i class="material-icons md-36">expand_more</i> &#x2014; .
  static IconData get arrowDown => IconBuilder(android: Icons.arrow_downward_rounded, iOS: Icons.expand_more).toGenerate;

  /// <i class="material-icons md-36">lock_rounded</i> &#x2014; <i class='cupertino-icons md-36'>lock_fill</i> &#x2014; .
  static IconData get lock => IconBuilder(android: Icons.lock_rounded, iOS: CupertinoIcons.lock_fill).toGenerate;

  /// <i class="material-icons md-36">lock_open_rounded</i> &#x2014; <i class='cupertino-icons md-36'>lock_open_fill</i> &#x2014; .
  static IconData get lockOpen => IconBuilder(android: Icons.lock_open_rounded, iOS: CupertinoIcons.lock_open_fill).toGenerate;

  /// <i class="material-icons md-36">bolt</i> &#x2014; <i class='cupertino-icons md-36'>bolt_fill</i> &#x2014; .
  static IconData get bolt => IconBuilder(android: Icons.bolt_rounded, iOS: CupertinoIcons.bolt_fill).toGenerate;

  /// <i class="material-icons-round md-36">flag</i> &#x2014; <i class='cupertino-icons md-36'>flag_fill</i> &#x2014; .
  static IconData get flag => IconBuilder(android: Icons.flag_rounded, iOS: CupertinoIcons.flag_fill).toGenerate;

  /// <i class="material-icons-round md-36">wifi_off</i> &#x2014; <i class='cupertino-icons md-36'>wifi_exclamationmark</i> &#x2014; .
  static IconData get wifiOff => IconBuilder(android: Icons.wifi_off_rounded, iOS: CupertinoIcons.wifi_exclamationmark).toGenerate;

  /// <i class="material-icons md-36">mail</i> &#x2014; <i class='cupertino-icons md-36'>mail_solid</i> &#x2014; .
  static IconData get email => IconBuilder(android: Icons.mail, iOS: CupertinoIcons.mail_solid).toGenerate;

  /// <i class="material-icons-round md-36">password</i> &#x2014; <i class='cupertino-icons md-36'>pencil_ellipsis_rectangle</i> &#x2014; .
  static IconData get password => IconBuilder(android: Icons.password_rounded, iOS: CupertinoIcons.pencil_ellipsis_rectangle).toGenerate;

  /// <i class="material-icons md-36">visibility_off</i> &#x2014; <i class='cupertino-icons md-36'>eye_slash</i> &#x2014; .
  static IconData get passwordHide => IconBuilder(android: Icons.visibility_off, iOS: CupertinoIcons.eye_slash).toGenerate;

  /// <i class="material-icons md-36">visibility</i> &#x2014; <i class='cupertino-icons md-36'>eye</i> &#x2014; .
  static IconData get passwordShow => IconBuilder(android: Icons.visibility, iOS: CupertinoIcons.eye).toGenerate;

  /// <i class="material-icons md-36">cloud_upload</i> &#x2014; <i class='cupertino-icons md-36'>cloud_upload_fill</i> &#x2014; .
  static IconData get upload => IconBuilder(android: Icons.cloud_upload, iOS: CupertinoIcons.cloud_upload_fill).toGenerate;

  /// <i class="material-icons md-36">send_rounded</i> &#x2014; <i class='cupertino-icons md-36'>arrow_up_circle_fill</i> &#x2014; .
  static IconData get send => IconBuilder(android: Icons.send_rounded, iOS: CupertinoIcons.arrow_up_circle_fill).toGenerate;

  /// <i class="material-icons-rounded md-36">photo_library</i> &#x2014; <i class='cupertino-icons md-36'>photo_fill_on_rectangle_fill</i> &#x2014; .
  static IconData get gallery => IconBuilder(android: Icons.photo_library_rounded, iOS: CupertinoIcons.photo_fill_on_rectangle_fill).toGenerate;

  /// <i class="material-icons-round md-36">contacts</i> &#x2014; <i class='cupertino-icons md-36'>person_2_square_stack_fill</i> &#x2014; .
  static IconData get contants => IconBuilder(android: Icons.contacts_rounded, iOS: CupertinoIcons.person_2_square_stack_fill).toGenerate;

  /// <i class="material-icons md-36">layers</i> &#x2014; <i class='cupertino-icons md-36'>layers_alt_fill</i> &#x2014; .
  static IconData get layers => IconBuilder(android: Icons.layers, iOS: CupertinoIcons.layers_alt_fill).toGenerate;

  /// <i class="material-icons md-36">copy_rounded</i> &#x2014; <i class='cupertino-icons md-36'>doc_on_clipboard_fill</i> &#x2014; .
  static IconData get copy => IconBuilder(android: Icons.copy_rounded, iOS: CupertinoIcons.doc_on_clipboard_fill).toGenerate;

  /// <i class="material-icons md-36">search</i> &#x2014; <i class='cupertino-icons md-36'>search</i> &#x2014; .
  static IconData get search => IconBuilder(android: Icons.search, iOS: CupertinoIcons.search).toGenerate;

  /// <i class="material-icons md-36">alarm</i> &#x2014; <i class='cupertino-icons md-36'>alarm</i> &#x2014; .
  static IconData get alarm => IconBuilder(android: Icons.alarm, iOS: CupertinoIcons.alarm).toGenerate;

  /// <i class="material-icons md-36">room</i> &#x2014; <i class='cupertino-icons md-36'>location_solid</i> &#x2014; .
  static IconData get location => IconBuilder(android: Icons.room, iOS: CupertinoIcons.location).toGenerate;

  /// <i class="material-icons md-36">bluetooth</i> &#x2014; <i class='cupertino-icons md-36'>bluetooth</i> &#x2014; .
  static IconData get bluetooth => IconBuilder(android: Icons.bluetooth, iOS: CupertinoIcons.bluetooth).toGenerate;

  /// <i class="material-icons md-36">camera_alt</i> &#x2014; <i class='cupertino-icons md-36'>camera_fill</i> &#x2014; .
  static IconData get camera => IconBuilder(android: Icons.camera_alt, iOS: CupertinoIcons.camera_fill).toGenerate;

  /// <i class="material-icons-sharp md-36">wifi</i> &#x2014; <i class='cupertino-icons md-36'>wifi</i> &#x2014; .
  static IconData get wifi => IconBuilder(android: Icons.wifi_sharp, iOS: CupertinoIcons.wifi).toGenerate;

  /// <i class="material-icons md-36">touch_app</i> &#x2014; <i class='cupertino-icons md-36'>cursor_rays</i> &#x2014; .
  static IconData get click => IconBuilder(android: Icons.touch_app, iOS: CupertinoIcons.cursor_rays).toGenerate;

  /// <i class="material-icons md-36">explore</i> &#x2014; <i class='cupertino-icons md-36'>compass_fill</i> &#x2014; .
  static IconData get compass => IconBuilder(android: Icons.explore, iOS: CupertinoIcons.compass_fill).toGenerate;

  /// <i class="material-icons md-36">refresh</i> &#x2014; <i class='cupertino-icons md-36'>refresh</i> &#x2014; .
  static IconData get refresh => IconBuilder(android: Icons.refresh, iOS: CupertinoIcons.refresh).toGenerate;

  /// <i class="material-icons md-36">av_timer</i> &#x2014; <i class='cupertino-icons md-36'>timer</i> &#x2014; .
  static IconData get timer => IconBuilder(android: Icons.av_timer, iOS: CupertinoIcons.timer).toGenerate;

  /// <i class="material-icons-rounded md-36">tune</i> &#x2014; <i class='cupertino-icons md-36'>slider_horizontal_3</i> &#x2014; .
  static IconData get slider => IconBuilder(android: Icons.tune_rounded, iOS: CupertinoIcons.slider_horizontal_3).toGenerate;

  /// <i class="material-icons md-36">help_rounded</i> &#x2014; <i class='cupertino-icons md-36'>question_circle_fill</i> &#x2014; .
  static IconData get question => IconBuilder(android: Icons.help_rounded, iOS: CupertinoIcons.question_circle_fill).toGenerate;

  /// <i class="material-icons md-36">push_pin</i> &#x2014; <i class='cupertino-icons md-36'>pin_fill</i> &#x2014; .
  static IconData get pin => IconBuilder(android: Icons.push_pin, iOS: CupertinoIcons.pin_fill).toGenerate;

  /// <i class="material-icons-outlined md-36">push_pin</i> &#x2014; <i class='cupertino-icons md-36'>pin</i> &#x2014; .
  static IconData get pinOff => IconBuilder(android: Icons.push_pin_outlined, iOS: CupertinoIcons.pin).toGenerate;

  /// <i class="material-icons md-36">warning_rounded</i> &#x2014; <i class='cupertino-icons md-36'>exclamationmark_triangle_fill</i> &#x2014; .
  static IconData get warning => IconBuilder(android: Icons.warning_rounded, iOS: CupertinoIcons.exclamationmark_triangle_fill).toGenerate;

  /// <i class="material-icons-rounded md-36">error</i> &#x2014; <i class='cupertino-icons md-36'>exclamationmark_circle_fill</i> &#x2014; .
  static IconData get error => IconBuilder(android: Icons.error_rounded, iOS: CupertinoIcons.exclamationmark_circle_fill).toGenerate;

  /// <i class="material-icons md-36">power_settings_new</i> &#x2014; <i class='cupertino-icons md-36'>power</i> &#x2014; .
  static IconData get power => IconBuilder(android: Icons.power_settings_new, iOS: CupertinoIcons.power).toGenerate;

  /// <i class="material-icons md-36">light_mode</i> &#x2014; <i class='cupertino-icons md-36'>sun_max_fill</i> &#x2014; .
  static IconData get themeLight => IconBuilder(android: Icons.light_mode, iOS: CupertinoIcons.sun_max_fill).toGenerate;

  /// <i class="material-icons md-36">dark_mode</i> &#x2014; <i class='cupertino-icons md-36'>moon_fill</i> &#x2014; .
  static IconData get themeDark => IconBuilder(android: Icons.dark_mode, iOS: CupertinoIcons.moon_fill).toGenerate;

  /// <i class="material-icons md-36">swap_horiz</i> &#x2014; <i class='cupertino-icons md-36'>arrow_right_arrow_left</i> &#x2014; .
  static IconData get leftRight => IconBuilder(android: Icons.swap_horiz, iOS: CupertinoIcons.arrow_right_arrow_left).toGenerate;
}
//IconBuilder(android:Icons.   , iOS: CupertinoIcons.  ).toGenerate;

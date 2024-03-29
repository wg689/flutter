import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bili_app/navigator/hi_navigator.dart';
import 'package:flutter_bili_app/page/profile_page.dart';
import 'package:flutter_bili_app/page/video_detail_page.dart';
import 'package:flutter_bili_app/util/color.dart';
import 'package:flutter_bili_app/util/format_util.dart';
import 'package:flutter_bili_app/widget/navigation_bar.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bili_app/provider/theme_provider.dart';

///带缓存的image
Widget cachedImage(String url, {double width, double height}) {
  return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (
        BuildContext context,
        String url,
      ) =>
          Container(color: Colors.grey[200]),
      errorWidget: (
        BuildContext context,
        String url,
        dynamic error,
      ) =>
          Icon(Icons.error),
      imageUrl: url);
}

void changeStatusBar(
    {color: Colors.white,
    StatusStyle statusStyle: StatusStyle.DARK_CONTENT,
    BuildContext context}) {
  if (context != null) {
    var themeProvider = context.read<ThemeProvider>();
    if (themeProvider.isDark()) {
      statusStyle = StatusStyle.LIGHT_CONTENT;
      color = HiColor.dark_bg;
    }
    var page = HiNavigator.getInstance().getCurrent()?.page;
    if (page is ProfilePage) {
      color = Colors.transparent;
    } else if (page is VideoDetailPage) {
      color = Colors.black;
    }
  }

  FlutterStatusbarManager.setColor(color, animated: false);
  FlutterStatusbarManager.setStyle(statusStyle == StatusStyle.DARK_CONTENT
      ? StatusBarStyle.DARK_CONTENT
      : StatusBarStyle.LIGHT_CONTENT);
}

blackLineraGradient({bool fromTop = false}) {
  return LinearGradient(
      begin: fromTop ? Alignment.topCenter : Alignment.bottomCenter,
      end: fromTop ? Alignment.bottomCenter : Alignment.topCenter,
      colors: [
        Colors.black54,
        Colors.black45,
        Colors.black38,
        Colors.black26,
        Colors.black12,
        Colors.transparent
      ]);
}

smallIconText(IconData iconData, var text) {
  var style = TextStyle(fontSize: 12, color: Colors.grey);
  if (text is int) {
    text = countFormat(text);
  }
  return [
    Icon(iconData, color: Colors.grey, size: 12),
    Text('$text', style: style)
  ];
}

borderLine(BuildContext context, {bottom: true, top: false}) {
  BorderSide borderSide = BorderSide(width: 0.5, color: Colors.grey[200]);
  return Border(
    bottom: bottom ? borderSide : BorderSide.none,
    top: top ? borderSide : BorderSide.none,
  );
}

SizedBox hiSpace({double height: 1, double width: 1}) {
  return SizedBox(height: height, width: width);
}

BoxDecoration bottomBoxShadow(BuildContext context) {
  var themeProvider = context.read<ThemeProvider>();
  if (themeProvider.isDark()) {
    return null;
  }
  return BoxDecoration(color: Colors.white, boxShadow: [
    BoxShadow(
        color: Colors.grey[100],
        offset: Offset(0, 5),
        blurRadius: 5.0,
        spreadRadius: 1),
  ]);
}

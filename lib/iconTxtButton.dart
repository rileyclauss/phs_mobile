import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:ui';
import 'dart:async';

class iconTxtBtn extends StatelessWidget {
  String _dest;
  String _icon;
  String _txt;

  iconTxtBtn(dest, icon, txt) {
    this._dest = dest;
    this._icon = icon;
    this._txt = txt;
  }

  Widget build(BuildContext context) {
    Widget imgTxtBtn = new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _launchURL(_dest),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Image.asset(
              // ignore: conflicting_dart_import
              _icon,
              colorBlendMode: BlendMode.src,
              width: 100.0,
              height: 90.0,
            ),
            // ignore: conflicting_dart_import
            new Text(
              _txt,
              style: new TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              textScaleFactor: .9,
            ),
          ],
        ));

    return imgTxtBtn;
  }

  void _launchURL(dest) async {
    try {
      await launch(
        dest,
        option: new CustomTabsOption(
          toolbarColor: Colors.black45,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn(),
          // or user defined animation.

          extraCustomTabs: <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}

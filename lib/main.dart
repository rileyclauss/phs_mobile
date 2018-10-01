import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:ui';
import 'dart:async';

void main() {
  //launch point for the application. Best practice is for main to be
  runApp(
      new FlutterView()); //empty except for the runApp which begins the build process.
} //goto line 12

class FlutterView extends StatelessWidget {
  //main widget for the overall scaffold
  @override //and all buttons
  Widget build(BuildContext context) {
    //MyHomePage is a seperate class because of other functions
    return new MaterialApp(
      //MaterialApp is a flutter object
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.grey,
        buttonColor: Colors.white54,
      ),
      home: new MyHomePage(), //goto line 21
    );
  }
}

class MyHomePage extends StatelessWidget {
  //homepage will not change, ie, stateless widget
  // ignore: must_be_immutable              //may have to implement stateful widget to get rss, contact, etc?

  @override
  Widget build(BuildContext context) {

    //deployment for new MyHomePage();
    var size = MediaQuery.of(context).size; //gets the size of the entire screen
    final double itemHeight =
        (size.height - kToolbarHeight - 24) / 2; //gets height - top toolbar
    final double itemWidth = size.width / 2; //gets screen width
    return new Scaffold(
      //scaffold is the base almost everything is built on. gives name bar and body
       //background color of icons
      appBar: new AppBar(
        //AppBar is the title at the top
        title: new Text('PHS Mobile'), //may remove if we get a nice background
        //background of titlebar. these colors don't seem to be implementing, however @TODO
      ),
      body: new Container(
        //Container for icons and text
        child: new GridView.count(
            //GridView.count is most effecient for formatting and adjusting to various screen sizes
            crossAxisCount: 4, //four icons per row
            mainAxisSpacing: 10.0, // 10px between tops and bottoms
            crossAxisSpacing: 8.0, // 8px side to side
            childAspectRatio: (itemWidth /
                itemHeight), //aspect ratio forced for items, in this case, iconTxtBtn
            padding: const EdgeInsets.only(
                //padding around the GridView itself
                left: 6.0,
                top: 0.0,
                right: 6.0,
                bottom: 0.0),
            children: <Widget>[
              new iconTxtBtn('https://pnn.phmschools.org/', 'images/newsicon.png', 'News'),
              new iconTxtBtn('https://calendar.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23ffcc33&src=phm.k12.in.us_jdattjdnmubmjev1moof0l8bh8%40group.calendar.google.com&color=%231B887A&ctz=America%2FNew_York/',
                  'images/calendaricon.png', 'Calendar'), //              iconTxtButton.dart file
              new iconTxtBtn('https://penn.phmschools.org/students-and-parents','images/sapicon.png', 'Students and Parents'), //and a title to be displayed under it
              new iconTxtBtn('academics', 'images/academicsicon.png', 'Academics',),
              new iconTxtBtn('https://penn.phmschools.org/counseling', 'images/counseling.png', 'Counseling'),
              new iconTxtBtn('https://pennant.phmschools.org/', 'images/athleticsicon.png', 'Athletics'),
              new iconTxtBtn('https://penn.phmschools.org/fine-arts-communications-academy-0', 'images/fineartsicon.png', 'Fine Arts'),
              new iconTxtBtn('https://penn.phmschools.org/students-and-parents/get-involved/students/clubs', 'images/clubsicon.png', 'Clubs'),
              new iconTxtBtn('https://www.phmschools.org/user', 'images/keyicon.png', 'Staff Links'),
              new iconTxtBtn('https://penn.phmschools.org/', 'images/pennwebsite.png', 'Penn Website'),
              new iconTxtBtn('https://penn.phmschools.org/staff-directory', 'images/contactusicon.png', 'Contact Us'),
              new iconTxtBtn('https://penn.phmschools.org/about', 'images/abouticon.png', 'About Penn'),
            ]),
      ),
    );
  }
} //build

class academicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Academics Links'),
      ),
      body: new Column(

        children: <Widget>[
          new SizedBox(
                width: double.infinity,
                child: new RaisedButton(
                  child: Text('HAC'),
                  onPressed: () {
                    try {
                      launch(
                        'https://hac.phmschools.org/HomeAccess/Account/LogOn?ReturnUrl=%2Fhomeaccess',
                        option: new CustomTabsOption(
                          toolbarColor: Colors.black45,
                          enableDefaultShare: true,
                          enableUrlBarHiding: true,
                          showPageTitle: true,
                          animation: new CustomTabsAnimation.slideIn(),
                          extraCustomTabs: <String>[
                            'org.mozilla.firefox',
                            'com.microsoft.emmx',
                          ],
                        ),
                      );
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                )),

          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text('Canvas'),
              onPressed: () {
                try {
                  launch(
                    'https://phm.instructure.com/login/ldap',
                    option: new CustomTabsOption(
                      toolbarColor: Colors.black45,
                      enableDefaultShare: true,
                      enableUrlBarHiding: true,
                      showPageTitle: true,
                      animation: new CustomTabsAnimation.slideIn(),
                      extraCustomTabs: <String>[
                        'org.mozilla.firefox',
                        'com.microsoft.emmx',
                      ],
                    ),
                  );
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

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
        onTap: () => _launchURL(_dest, context),
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

  void _launchURL(dest, context) async {
    if (dest == 'academics') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => academicsPage()),
      );
    } else if (dest == 'stafflinks') {
    } else {
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
}

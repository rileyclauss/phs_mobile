import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:ui';
import 'Strings.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  //launch point for the application. Best practice is for main to be
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) {
      print('on message $message');
    },
    onResume: (Map<String, dynamic> message) {
      print('on resume $message');
    },
    onLaunch: (Map<String, dynamic> message) {
      print('on launch $message');
    },
  );
  _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true));
  _firebaseMessaging.getToken().then((token){
    print(token);
  });
  runApp(

      new FlutterView()); //empty except for the runApp which begins the build process.
}

class FlutterView extends StatelessWidget {
  //main widget for the overall scaffold
  @override //and all buttons
  Widget build(BuildContext context) {
    //MyHomePage is a separate class because of other functions
    return new MaterialApp(
      //MaterialApp is a flutter object
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.yellow,
        buttonColor: Colors.black,
      ),
      // ignore: new_with_undefined_constructor_default
      home: new MyHomePage(), //goto line 21
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  //_MyHomePageState StatefulWidget.createState() => _MyHomePageState
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //homepage will not change, ie, stateless widget
  // ignore: must_be_immutable
  // may have to implement stateful widget to get rss, contact, etc?
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

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
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        //AppBar is the title at the top
        centerTitle: true,
        title: new Text(
            'Penn High School'), //may remove if we get a nice background
        //background of titlebar.
        /*leading:IconButton(
          icon: Icon(Icons.message),
          tooltip: 'Anouncements',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder:(context) => Announcements()),
            );
          },
        ),*/
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            tooltip: 'Credits',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Credits()),
              );
              },
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/background.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          new Container(
            //Container for icons and text

            child: new GridView.count(
                //GridView.count is most efficient for formatting and adjusting to various screen sizes

                crossAxisCount: 4, //four icons per row
                mainAxisSpacing: 10.0, // 10px between tops and bottoms
                crossAxisSpacing: 8.0, // 8px side to side
                childAspectRatio: (itemWidth /
                    itemHeight), //aspect ratio forced for items, in this case, IconTxtBtn
                padding: const EdgeInsets.only(
                    //padding around the GridView itself
                    left: 10.0,
                    top: 0.0,
                    right: 10.0,
                    bottom: 0.0),
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  new IconTxtBtn('https://penn.phmschools.org/news',
                      'images/newsicon.png', Strings.TitlesEng[0]),
                  new IconTxtBtn(
                      'https://penn.phmschools.org/calendars#app',
                      'images/calendaricon.png',
                      Strings.TitlesEng[1]), //              IconTxtButton.dart file
                  new IconTxtBtn(
                      'https://penn.phmschools.org/students-and-parents',
                      'images/sapicon.png',
                      Strings.TitlesEng[2]), //and a title to be displayed under it
                  new IconTxtBtn(
                    'academics',
                    'images/academicsicon.png',
                    Strings.TitlesEng[3],
                  ),
                  new IconTxtBtn('https://penn.phmschools.org/counseling#app',
                      'images/counseling.png', Strings.TitlesEng[4]),
                  new IconTxtBtn('https://pennant.phmschools.org/',
                      'images/athleticsicon.png', Strings.TitlesEng[5]),
                  new IconTxtBtn(
                      'https://penn.phmschools.org/performing-arts#app',
                      'images/fineartsicon.png',Strings.TitlesEng[6]),
                  new IconTxtBtn(
                      'https://penn.phmschools.org/students-and-parents/get-involved/students/clubs',
                      'images/clubsicon.png',
                      Strings.TitlesEng[7]),
                  new IconTxtBtn(
                      'stafflinks', 'images/keyicon.png', Strings.TitlesEng[8]),
                  new IconTxtBtn('https://www.phmschools.org/safe-school-helpline',
                      'images/phoneicon.png', Strings.TitlesEng[9]),
                  new IconTxtBtn('https://penn.phmschools.org/staff-directory',
                      'images/contactusicon.png', Strings.TitlesEng[10]),
                  new IconTxtBtn('https://penn.phmschools.org/students-and-parents/stay-informed',
                      'images/getconnectedicon.png', Strings.TitlesEng[11]),
                ]),
          ),
        ],
      ),
    );
  }
} //build
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['post'],
      body: json['body'],
    );
  }
}

/* class Announcements extends StatelessWidget {
  @override
  Future<http.Response> fetchPost() {
    return http.get('http://www.json-generator.com/api/json/get/coKOhIBBIO?indent=2');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Anouncements')),
        body: new Column(
          children: <Widget>[
            new Center(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                        "Testing",
                        textAlign: TextAlign.center)))
          ],
        ));
  }
}
*/
class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Credits')),
        body: new Column(
          children: <Widget>[
            new Center(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                        "\n\n\nApple Developer: Micah Focht\n\n"
                        "Android Developer: Riley Clauss\n\n"
                        "Graphics and Design: James Morris\n\n",
                        textAlign: TextAlign.center))),
            new SizedBox(
              width: double.infinity,
              child: new RaisedButton(
                child: Text(
                  'Open Source Licenses',
                  style: new TextStyle(color: Colors.yellow),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpenSourceLibraries()),
                  );
                },
              ),
            ),
            new SizedBox(
              width: double.infinity,
              child: new RaisedButton(
                child: Text(
                  'Privacy Policy',
                  style: new TextStyle(color: Colors.yellow),
                ),
                onPressed: () {
                  _launchURL('https://docs.google.com/document/u/1/d/e/2PACX-1vShjxcbuhMkyFu6nYC-hx17HRvBFXH5TsZ9trCMZ2iPQj9-XTw1PMZjaDEa8K6MwxBiqahj1aENb5o2/pub', context);
                },
              ),
            ),
          ],
        ));
  }
  void _launchURL(dest, context) async {
    try {
      await launch(
        dest,
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
  }
/*


 */
}

class OpenSourceLibraries extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Licensing'),
      ),
      body: Flex(children: <Widget>[
        Expanded(child: Container(
          padding: EdgeInsets.all(5.0),
          child: SingleChildScrollView(child: Text(
            Strings.TABSopenSource + Strings.LAUNCHopenSource + Strings.FlutteropenSource,
            maxLines: null,

            overflow: TextOverflow.clip,
          ))
        ),
        )
      ], direction: Axis.vertical,)
    );
  }
}
/*
 */
//new Text('Special thanks to the Android Libraries and StackOverflow.'),

class AcademicLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Academics Links'),
      ),
      body: new ListView(
        children: <Widget>[
          new SizedBox(
              width: double.infinity,
              child: new RaisedButton(
                child: Text(
                  'HAC',
                  style: new TextStyle(color: Colors.yellow),
                ),
                onPressed: () {
                  _launchURL(
                      'https://hac.phmschools.org/HomeAccess/Account/LogOn?ReturnUrl=%2Fhomeaccess',
                      context);
                },
              )),
          new Text(
            'Home Access Center is a web-based program that allows students and parents to track check progress and grades, manage schedules, and track attendance. This will take you to the login page.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text(
                'Canvas',
                style: new TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                _launchURL('https://phm.instructure.com/login/ldap', context);
              },
            ),
          ),
          new Text(
            'Canvas is the system Penn teachers and staff use to distribute agendas and assignments to students throughout the year. This will take you to the login page.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text(
                'Clever',
                style: new TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                _launchURL('https://clever.com/in/phmschools', context);
              },
            ),
          ),
          new Text(
            'Clever is a useful hub for all students to access specific links and pages used frequently in their classes. This will take you to the login page.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          //
        ],
      ),
    );
  }
//
  void _launchURL(dest, context) async {
    try {
      await launch(
        dest,
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
  }
}

class StaffLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Staff Links'),
      ),
      body: new ListView(
        children: <Widget>[
          new SizedBox(
              width: double.infinity,
              child: new RaisedButton(
                child: Text(
                  'TAC',
                  style: new TextStyle(color: Colors.yellow),
                ),
                onPressed: () {
                  _launchURL(
                      'https://eschoolplus.phmschools.org/TAC/Account/LogOn?ReturnUrl=%2fTAC',
                      context);
                },
              )),
          new Text(
            'This will take you to the login page for TAC/eSchool.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text(
                'Doculivery',
                style: new TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                _launchURL(
                    'https://my.doculivery.com/External/PHMSchools/Login.aspx',
                    context);
              },
            ),
          ),
          new Text(
            'This will take you to the Doculivery System login page for PHM\'s payroll and paystub information.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text(
                'Clever',
                style: new TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                _launchURL('https://clever.com/in/phmschools', context);
              },
            ),
          ),
          new Text(
            'Clever is a useful hub for all students to access specific links and pages used frequently in their classes. This will take you to the login page.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text(
                'Canvas',
                style: new TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                _launchURL('https://phm.instructure.com/login/ldap', context);
              },
            ),
          ),
          new Text(
            'Canvas is the system Penn teachers and staff use to distribute agendas and assignments to students throughout the year. This will take you to the login page.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign:
                TextAlign.center, //https://adminweb.aesoponline.com/access
          ),
          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text(
                'Frontline (Aesop)',
                style: new TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                _launchURL('https://adminweb.aesoponline.com/access', context);
              },
            ),
          ),
          new Text(
            'Frontline Education, formerly known as Aesop, is an absence management resource for teachers. This will take you to the login page.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign:
                TextAlign.center, //https://adminweb.aesoponline.com/access
          ),
          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text(
                'Home File Access',
                style: new TextStyle(color: Colors.yellow),
              ),
              onPressed: () {
                _launchURL(
                    'https://sites.google.com/a/phm.k12.in.us/home-file-access/',
                    context);
              },
            ),
          ),
          new Text(
            'This Google Site will guide you through accesing your computer\'s files from home.',
            style: new TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          //
        ],
      ),
    );
  }

  void _launchURL(dest, context) async {
    try {
      await launch(
        dest,
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
  }
}

class IconTxtBtn extends StatelessWidget {
  String _dest;
  String _icon;
  String _txt;

  IconTxtBtn(dest, icon, txt) {
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
        MaterialPageRoute(builder: (context) => AcademicLinks()),
      );
    } else if (dest == 'stafflinks') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StaffLinks()),
      );
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
            extraCustomTabs: <String>[
              'org.mozilla.firefox',
              'com.microsoft.emmx',
            ],
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}

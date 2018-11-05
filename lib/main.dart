import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() {
  //launch point for the application. Best practice is for main to be
  runApp(
      new FlutterView()); //empty except for the runApp which begins the build process.
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
}

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
        accentColor: Colors.yellow,
        buttonColor: Colors.black,

      ),
      // ignore: new_with_undefined_constructor_default
      home: new MyHomePage(), //goto line 21
    );
  }
}
class MyHomePage extends StatefulWidget {
  //@override
  //_MyHomePageState StatefulWidget.createState() => _MyHomePageState
  final String _appBarTitle;

  MyHomePage(this._appBarTitle, { Key key }) : super(key: key);
  @override
  MyHomePageState createState() => new _MyHomePagestate();

}


class _MyHomePagestate extends State<MyHomePageState> {
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
    _firebaseMessaging.getToken().then((token){
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
        title: new Text('Penn High School'), //may remove if we get a nice background
        //background of titlebar.
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
                children: <Widget>[
                  new IconTxtBtn('https://penn.phmschools.org/news',
                      'images/newsicon.png', 'News'),
                  new IconTxtBtn(
                      'https://calendar.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23ffcc33&src=phm.k12.in.us_jdattjdnmubmjev1moof0l8bh8%40group.calendar.google.com&color=%231B887A&ctz=America%2FNew_York/',
                      'images/calendaricon.png',
                      'Calendar'), //              IconTxtButton.dart file
                  new IconTxtBtn(
                      'https://penn.phmschools.org/students-and-parents',
                      'images/sapicon.png',
                      'Students and Parents'), //and a title to be displayed under it
                  new IconTxtBtn(
                    'academics',
                    'images/academicsicon.png',
                    'Academics',
                  ),
                  new IconTxtBtn('https://penn.phmschools.org/counseling',
                      'images/counseling.png', 'Counseling'),
                  new IconTxtBtn('https://pennant.phmschools.org/',
                      'images/athleticsicon.png', 'Athletics'),
                  new IconTxtBtn(
                      'https://penn.phmschools.org/fine-arts-communications-academy-0',
                      'images/fineartsicon.png',
                      'Fine Arts'),
                  new IconTxtBtn(
                      'https://penn.phmschools.org/students-and-parents/get-involved/students/clubs',
                      'images/clubsicon.png',
                      'Clubs'),
                  new IconTxtBtn('stafflinks',
                      'images/keyicon.png', 'Staff Links'),
                  new IconTxtBtn('https://penn.phmschools.org/',
                      'images/pennwebsite.png', 'Penn Website'),
                  new IconTxtBtn('https://penn.phmschools.org/staff-directory',
                      'images/contactusicon.png', 'Contact Us'),
                  new IconTxtBtn('https://penn.phmschools.org/about',
                      'images/abouticon.png', 'About Penn'),
                ]),
          ),
        ],
      ),
    );
  }
} //build


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
                child: Text('HAC', style: new TextStyle(color: Colors.yellow),),
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
              child: Text('Canvas', style: new TextStyle(color: Colors.yellow),),

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
              child: Text('Clever', style: new TextStyle(color: Colors.yellow),),
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
              child: Text('Lunch Menus', style: new TextStyle(color: Colors.yellow),),
              onPressed: () {
                _launchURL('https://www.phmschools.org/food-service/penn-menus',
                    context);
              },
            ),
          ),
          new Text(
            'The Kingsmen Cafe offers seven different food stations for Penn students to choose from daily. Penn offers both lunch and breakfast to students. This will take you to the menu.',
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
                child: Text('TAC', style: new TextStyle(color: Colors.yellow),),
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
              child: Text('Doculivery', style: new TextStyle(color: Colors.yellow),),

              onPressed: () {
                _launchURL('https://my.doculivery.com/External/PHMSchools/Login.aspx', context);
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
              child: Text('Clever', style: new TextStyle(color: Colors.yellow),),
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
              child: Text('Canvas', style: new TextStyle(color: Colors.yellow),),
              onPressed: () {
                _launchURL('https://phm.instructure.com/login/ldap',
                    context);
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

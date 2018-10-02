import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:ui';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text('Welcome In SplashScreen',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.asset('image/splashscreen.png'),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Click!"),
        loaderColor: Colors.yellow
    );
  }
}

class AfterSplash extends StatelessWidget {
  //main widget for the overall scaffold
  @override //and all buttons
  Widget build(BuildContext context) {
    //MyHomePage is a separate class because of other functions
    return new MaterialApp(
      //MaterialApp is a flutter object
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.grey,
        buttonColor: Colors.white24,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.yellow,
          displayColor: Colors.yellow,
        )
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
        //background of titlebar.
      ),
      body: new Stack(
              children: <Widget>[
                new Container(decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("images/background.png"), fit: BoxFit.cover,),
                ),),
                new Container(
                //Container for icons and text
                child: new GridView.count(
                  //GridView.count is most efficient for formatting and adjusting to various screen sizes
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
              ],
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
      body: new ListView(
        children: <Widget>[
          new SizedBox(
                width: double.infinity,
                child: new RaisedButton(
                  child: Text('HAC'),
                  onPressed: () {
                    _launchURL('https://hac.phmschools.org/HomeAccess/Account/LogOn?ReturnUrl=%2Fhomeaccess', context);
                  },
                )),
          new Text('Home Access Center is a web-based program that allows students and parents to track check progress and grades, manage schedules, and track attendance. This button will take you to the login page.',
            style: new TextStyle(
              color: Colors.white12,
            ),
          textAlign: TextAlign.center,),
          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text('Canvas'),
              onPressed: () {
                _launchURL('https://phm.instructure.com/login/ldap', context);
              },
            ),
          ),
          new Text('Canvas is the system Penn teachers and staff use to distribute agendas and assignments to students throughout the year. This button will take you to the login page.',
          style: new TextStyle(
            color: Colors.white12,
          ),
          textAlign: TextAlign.center,),

          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text('Clever'),
              onPressed: () {
                _launchURL('https://clever.com/in/phmschools', context);
              },
            ),
          ),
          new Text('Clever is a useful hub for all students to access specific links and pages used frequently in their classes. This button will take you to the login page.',
            style: new TextStyle(
              color: Colors.white12,
            ),
            textAlign: TextAlign.center,),

          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              child: Text('Lunch Menus'),
              onPressed: () {
                _launchURL('https://www.phmschools.org/food-service/penn-menus', context);
              },
            ),
          ),
          new Text('The Kingsmen Cafe offers seven different food stations for Penn students to choose from daily. Penn offers both lunch and breakfast to students. This button will take you to the menu.',
            style: new TextStyle(
              color: Colors.white12,
            ),
            textAlign: TextAlign.center,),

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

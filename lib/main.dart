import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:ui';
// Uncomment lines 4 and 7 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new FlutterView());
}

class FlutterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}







class MyHomePage extends StatelessWidget {
  // ignore: must_be_immutable


  Widget buttonColumn(String img, String txt, String dest){

    Widget imgTxtBtn = new GestureDetector(
      onTap: newState(dest),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,

        children: <Widget>[

          new Image.asset( // ignore: conflicting_dart_import
            img,
            colorBlendMode: BlendMode.src,
            width: 100.0,
            height: 90.0,


          ),
          // ignore: conflicting_dart_import
          new Text(txt, style: new TextStyle(color: Colors.white), textAlign: TextAlign.center, overflow: TextOverflow.fade, textScaleFactor: 1.0,),

        ],

      )
    );
      return imgTxtBtn;
  }
  void _launchURL(BuildContext context) async {
    try {
      await launch(
        'https://flutter.io/',
        option: new CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn()

      ),
    );
    } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
    }
  }



  newState(String dest)async {
    if (dest == 'website'){
      try {
        await launch(
            'http://penn.phmschools.org/',
            option: new CustomTabsOption(
            toolbarColor: Colors.black54,
            enableDefaultShare: true,
            enableUrlBarHiding: true,
            showPageTitle: true,
            animation: new CustomTabsAnimation.slideIn()
    // or user defined animation.

    ),
    );
    } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
    }
    }
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text('PHS Mobile'),
        backgroundColor: Colors.black54,

      ),
      body:
      new Container(
        child:
        new GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 0.0,
            childAspectRatio: (itemWidth / itemHeight),
            padding: const EdgeInsets.all(1.0),
            children: <Widget>[
              buttonColumn(
                'images/newsicon.png', 'News', 'news'
              ),
              buttonColumn(
                'images/calendaricon.png', 'Calendar', 'calendar'
              ),
              buttonColumn(
                'images/sapicon.png', 'Students and Parents', 'sap'
              ),
              buttonColumn(
                'images/academicsicon.png', 'Academics', 'academies'
              ),
              buttonColumn(
                'images/counseling.png', 'Counseling', 'counseling'
              ),
              buttonColumn(
                'images/athleticsicon.png', 'Athletics', 'athletics'
              ),
              buttonColumn(
                'images/fineartsicon.png', 'Fine Arts', 'arts'
              ),
              buttonColumn(
                'images/clubsicon.png', 'Clubs', 'clubs'
              ),
              buttonColumn(
                'images/keyicon.png', 'Staff Links', 'links'
              ),
              buttonColumn(
                'images/pennwebsite.png', 'Penn Website', 'website'
              ),
              buttonColumn(
                'images/contactusicon.png', 'Contact Us', 'contact'
              ),
              buttonColumn(
                'images/abouticon.png', 'About Penn', 'about'
              ),
            ]

        ),

      ),

    );
  }

  } //build





  // Create a grid with 4 columns. If you change the scrollDirection to
  // horizontal, this would produce 2 rows.

  /*new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButtonColumn(new AssetImage('images/news.png'), 'News'),
                buildButtonColumn(new AssetImage('images/calendar.png'), 'Calendars'),
                buildButtonColumn(new AssetImage('images/parents_and_students.png'), 'Students and Parents'),
                buildButtonColumn(new AssetImage('images/academicsicon.png'), 'Academics'),]
          ),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButtonColumn(new AssetImage('images/counselingicon.png'), 'Counseling'),
                buildButtonColumn(new AssetImage('images/athleticsicon.png'), 'Athletics'),
                buildButtonColumn(new AssetImage('images/finearts.png'), 'Fine Arts'),
                buildButtonColumn(new AssetImage('images/clubs.png'), 'Clubs'),]
          ),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildButtonColumn(new AssetImage('images/key.png'), 'Staff Links'),
                buildButtonColumn(new AssetImage('images/pennwebsite.png'), 'Penn Website'),
                buildButtonColumn(new AssetImage('images/contact_us.png'), 'Contact Us'),
                buildButtonColumn(new AssetImage('images/abouticon.png'), 'About Penn'),]
          )*/



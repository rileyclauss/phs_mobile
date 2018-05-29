import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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


  Widget buttonColumn(String img, String txt){



    Widget imgTxtBtn = new GestureDetector(
     // onTap: newState(),
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
                'images/newsicon.png', 'News',
              ),
              buttonColumn(
                'images/calendaricon.png', 'Calendar',
              ),
              buttonColumn(
                'images/sapicon.png', 'Students and Parents',
              ),
              buttonColumn(
                'images/academicsicon.png', 'Academics',
              ),
              buttonColumn(
                'images/counseling.png', 'Counseling',
              ),
              buttonColumn(
                'images/athleticsicon.png', 'Athletics',
              ),
              buttonColumn(
                'images/fineartsicon.png', 'Fine Arts',
              ),
              buttonColumn(
                'images/clubsicon.png', 'Clubs',
              ),
              buttonColumn(
                'images/keyicon.png', 'Staff Links',
              ),
              buttonColumn(
                'images/pennwebsite.png', 'Penn Website',
              ),
              buttonColumn(
                'images/contactusicon.png', 'Contact Us',
              ),
              buttonColumn(
                'images/abouticon.png', 'About Penn',
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



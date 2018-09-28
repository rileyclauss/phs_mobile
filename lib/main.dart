import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'dart:ui';
import 'iconTxtButton.dart';
import 'dart:async';

void main() {   //launch point for the application. Best practice is for main to be
  runApp(new FlutterView()); //empty except for the runApp which begins the build process.
}   //goto line 12

class FlutterView extends StatelessWidget {  //main widget for the overall scaffold
  @override                                  //and all buttons
  Widget build(BuildContext context) {       //MyHomePage is a seperate class because of other functions
    return new MaterialApp(                  //MaterialApp is a flutter object
      home: new MyHomePage(),                //goto line 21
    );
  }
}

class MyHomePage extends StatelessWidget {  //homepage will not change, ie, stateless widget
  // ignore: must_be_immutable              //may have to implement stateful widget to get rss, contact, etc?

  @override
  Widget build(BuildContext context) {      //deployment for new MyHomePage();
    var size = MediaQuery.of(context).size; //gets the size of the entire screen
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2; //gets height - top toolbar
    final double itemWidth = size.width / 2;//gets screen width
    return new Scaffold(                    //scaffold is the base almost everything is built on. gives name bar and body
      backgroundColor: Colors.black38,      //background color of icons
      appBar: new AppBar(                   //AppBar is the title at the top
        title: new Text('PHS Mobile'),      //may remove if we get a nice background
        backgroundColor: Colors.black54,    //background of titlebar. these colors don't seem to be implementing, however @TODO
      ),
      body: new Container(                  //Container for icons and text
        child: new GridView.count(          //GridView.count is most effecient for formatting and adjusting to various screen sizes
            crossAxisCount: 4,              //four icons per row
            mainAxisSpacing: 10.0,          // 10px between tops and bottoms
            crossAxisSpacing: 8.0,          // 8px side to side
            childAspectRatio: (itemWidth / itemHeight), //aspect ratio forced for items, in this case, iconTxtBtn
            padding: const EdgeInsets.only(   //padding around the GridView itself
                left: 6.0, top: 0.0, right: 6.0, bottom: 0.0),
            children: <Widget>[
              new iconTxtBtn(
                  'https://penn.phmschools.org/', 'images/newsicon.png', 'News'),
              new iconTxtBtn(                                                                            //all of these are instances of iconTxtBtn, defined in the
                  'https://penn.phmschools.org/', 'images/calendaricon.png', 'Calendar'),  //              iconTxtButton.dart file
              new iconTxtBtn(                                                                            //every instance has a destination, either website or title, an icon,
                  'https://penn.phmschools.org/', 'images/sapicon.png', 'Students and Parents'),         //and a title to be displayed under it
              new iconTxtBtn(
                'https://penn.phmschools.org/academies', 'images/academicsicon.png', 'Academics',),
              new iconTxtBtn(
                  'https://penn.phmschools.org/counseling', 'images/counseling.png', 'Counseling'),
              new iconTxtBtn(
                  'https://pennant.phmschools.org/','images/athleticsicon.png', 'Athletics'),
              new iconTxtBtn(
                  'https://penn.phmschools.org/fine-arts-communications-academy-0', 'images/fineartsicon.png', 'Fine Arts'),
              new iconTxtBtn(
                  'https://penn.phmschools.org/students-and-parents/get-involved/students/clubs', 'images/clubsicon.png', 'Clubs'),
              new iconTxtBtn(
                  'https://my.doculivery.com/External/PHMSchools/Login.aspx', 'images/keyicon.png', 'Staff Links'),
              new iconTxtBtn(
                  'https://penn.phmschools.org/', 'images/pennwebsite.png', 'Penn Website'),
              new iconTxtBtn(
                  'https://penn.phmschools.org/office-hours', 'images/contactusicon.png', 'Contact Us'),
              new iconTxtBtn(
                  'https://penn.phmschools.org/about', 'images/abouticon.png', 'About Penn'),
            ]),
      ),
    );
  }
} //build

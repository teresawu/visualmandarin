import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_helper/icons_helper.dart';
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/navigation/NavPage.dart';

Material getMaterial(BuildContext context, double value) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  double screenWidth = mediaQueryData.size.width;
  double screenHeight = mediaQueryData.size.height;

  return Material(
    color: Colors.transparent,
    child: Container(
      width: screenWidth,
      height: screenHeight,
      color: Color(0xff515151),
      child: new Stack(
        children: <Widget>[
          ///
          /// Menu title
          ///
          new Positioned(
            top: 32.0,
            left: 40.0,
            width: screenWidth,
            height: 24.0,
            child: new Transform.rotate(
                alignment: Alignment.topLeft,
                origin: Offset.zero,
                angle: pi / 2.0,
                child: new Center(
                  child: new Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: new Opacity(
                      opacity: value,
                      child: new Text('QUESTIONS',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Color(0xff515151),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          )),
                    ),
                  ),
                )),
          ),

          ///
          /// Hamburger icon
          ///
          new Positioned(
            top: 32.0,
            left: 4.0,
            child: new IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => NavPageState().playAnimation()),
          ),

          ///
          /// Menu content
          ///
          new Padding(
            padding: const EdgeInsets.only(left: 64.0, top: 96.0),
            child: new Container(
                child: new Center(child: getFutureBuilder(context))),
          ),
        ],
      ),
    ),
  );
}

FutureBuilder getFutureBuilder(BuildContext context) {
  return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(Keys.JSON_PATH),
      builder: (context, snapshot) {
        // Decode the JSON
        var menuData = json.decode(snapshot.data.toString());
        return new ListView.builder(
            padding: const EdgeInsets.all(14.0),
            itemBuilder: (context, index) {
              if (index.isOdd) return Divider();
              return new ListTile(
                leading: new Icon(
                    getIconGuessFavorMaterial(name: menuData["icon"]),
                    color: Colors.white),
                title: RaisedButton(
                  onPressed: () {
                    print('Button clicked');
                  },
                  child: new Text(
                    menuData["title"],
                    style: new TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ),
              );
            });
      });
}

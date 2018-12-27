import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visualmandarin/Keys.dart';

Positioned getPositioned(double screenWidth, double value) {
  return Positioned(
    top: 32.0,
    left: 40.0,
    width: screenWidth,
    height: 24.0,
    child: Transform.rotate(
        alignment: Alignment.topLeft,
        origin: Offset.zero,
        angle: pi / 2.0,
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: value,
              child: Text('QUESTIONS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  )),
            ),
          ),
        )),
  );
}

Positioned getHamPositioned(Function func) {
  return Positioned(
    top: 32.0,
    left: 4.0,
    child: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: func),
  );
}

Padding getPadding(BuildContext context) {
  int _itemCount = 11;
  return Padding(
    padding: const EdgeInsets.only(left: 64.0, top: 96.0),
    child: Container(
        child: Center(
            child: FutureBuilder(
                future:
                    DefaultAssetBundle.of(context).loadString(Keys.JSON_PATH),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var menuData = json.decode(snapshot.data.toString());
                  return ListView.builder(
                      itemCount: _itemCount,
                      padding: const EdgeInsets.only(
                          left: 14.0, top: 14.0, right: 70.0, bottom: 14.0),
                      itemBuilder: (context, index) {
                        var title = menuData[index]['title'].toString();
                        final Widget listTile = index == _itemCount
                            ? reachedEnd()
                            : raisedButton(title);
                        return listTile;
                      });
                }))),
  );
}

Widget raisedButton(String title) {
  return RaisedButton(
    color: Color(Keys.DARK_GREY),
    elevation: 20.0,
    onPressed: () {
      print('Button clicked');
    },
    child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        )),
  );
}

Widget reachedEnd() {
  return const Padding(
    padding: const EdgeInsets.all(20.0),
    child: const Center(
      child: const CircularProgressIndicator(),
    ),
  );
}

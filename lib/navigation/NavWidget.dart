import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:visualmandarin/Keys.dart';

Positioned getTitleStyle(double screenWidth, double value) {
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
              child: Text(Keys.TITLE,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
            ),
          ),
        )),
  );
}

Positioned getHamburgerIcon(Function func) {
  return Positioned(
    top: 32.0,
    left: 4.0,
    child: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () {
        func();
      },
    ),
  );
}

Widget loadNavData(BuildContext context, Function func, Function func2) {
  return Padding(
    padding: const EdgeInsets.only(left: 40.0, top: 96.0),
    child: Container(
        child: Center(
            child: FutureBuilder(
                future:
                    DefaultAssetBundle.of(context).loadString(Keys.JSON_PATH),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var menuData = json.decode(snapshot.data.toString());
                  return ListView.builder(
                      itemCount: menuData.length,
                      padding: const EdgeInsets.only(
                          left: 14.0, top: 14.0, right: 50.0, bottom: 14.0),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey),
                              onPressed: () {
                                func();
                                Keys.PATH = Keys.indexMap[index]!;
                                Keys.TITLE =
                                    menuData[index]['title'].toString();
                                func2();
                              },
                              child: Text(
                                menuData[index]['title'].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              )),
                        );
                      });
                }))),
  );
}

// Widget loadNavData(BuildContext context, Function func, Function func2) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 40.0, top: 96.0),
//     child: Container(
//         child: Center(
//             child: StreamBuilder<QuerySnapshot>(
//                 stream: Firestore.instance.collection('menu').snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) return LinearProgressIndicator();
//                   return ListView.builder(
//                       itemCount: 10,
//                       padding: const EdgeInsets.only(
//                           left: 14.0, top: 14.0, right: 50.0, bottom: 14.0),
//                       itemBuilder: (context, index) {
//                         List<DocumentSnapshot> menuData = snapshot.data
//                             .documents;
//                         return ListTile(
//                           title: RaisedButton(
//                               color: Color(Keys.DARK_GREY),
//                               elevation: 20.0,
//                               onPressed: () {
//                                 func();
//                                 Keys.PATH = Keys.indexMap[index];
//                                 Keys.TITLE =
//                                     menuData[index].toString();
//                                 func2();
//                               },
//                               child: Text(
//                                 menuData[index].toString(),
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18.0),
//                               )),
//                         );
//                       });
//                 }))),
//   );
// }

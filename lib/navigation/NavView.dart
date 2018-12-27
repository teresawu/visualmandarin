import 'package:flutter/material.dart';

class NavView extends StatefulWidget {
  @override
  NavState createState() => NavState();
}

class NavState extends State <NavView> {
  @override
  Widget build (BuildContext context){
    return SafeArea (
      top: false,
      bottom: false,
      child: new Container(
        child: new Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
//            new QuestionPage(),
//            new MenuPage(),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:visualmandarin/navigation/NavPage.dart';

class NavView extends StatefulWidget {
  @override
  NavViewState createState() => NavViewState();
}

class NavViewState extends State<NavView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        child: new Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
//             QuestionPage(),
            NavPage(),
          ],
        ),
      ),
    );
  }
}

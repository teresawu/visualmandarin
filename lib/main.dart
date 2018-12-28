import 'package:flutter/material.dart';
import 'package:visualmandarin/navigation/NavView.dart';
import 'package:visualmandarin/Keys.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'VisualMandarin',
      home: new NavView(),
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.dark,
        primaryColor: Color(Keys.DARK_GREY),
        accentColor: Color(Keys.DARK_GREY),
        fontFamily: 'Montserrat',
      ),
    );
  }
}

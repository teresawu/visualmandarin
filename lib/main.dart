import 'package:flutter/material.dart';
import 'package:visualmandarin/navigation/NavView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'VisualMandarin',
      home: new NavView(),
    );
  }
}

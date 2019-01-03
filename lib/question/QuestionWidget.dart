import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/model/Question.dart';

List<Widget> loadQuestions(Data data, Function func) {
  List<Widget> questionCell = [];
  var _splashColor;
  var _highlightColor;

  for (int i = 0; i < data.imagesList.length; i++) {
    if (data.answer == i) {
      _splashColor = Colors.green.withAlpha(60);
      _highlightColor = Colors.green.withAlpha(100);
    } else {
      _splashColor = Colors.red.withAlpha(60);
      _highlightColor = Colors.red.withAlpha(100);
    }
    questionCell.add(Card(
      color: Colors.white,
      child: InkWell(
        highlightColor: _highlightColor,
        splashColor: _splashColor,
        child: Center(
            child: Image(
                image: AssetImage(
                    Keys.PATH_IMAGE + data.imagesList[i].toString()))),
        onTap: () {
          if (data.answer == i) func();
        },
      ),
    ));
  }
  return questionCell;
}

Future<String> loadAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<Question> loadQuestion(String path) async {
  String jsonPage = await loadAsset(path);
  final jsonResponse = json.decode(jsonPage);
  return await Question.fromJson(jsonResponse);
}

Widget getFloatingButton(BuildContext context, AnimationController controller,
    List<IconData> icons, Function func1, Function func2) {
  return new Column(
    mainAxisSize: MainAxisSize.min,
    children: new List.generate(icons.length, (int index) {
      Widget child = new Container(
        height: 70.0,
        width: 56.0,
        alignment: FractionalOffset.topCenter,
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0 - index / icons.length / 2.0,
                curve: Curves.easeOut),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            mini: true,
            child: Icon(icons[index], color: Colors.orange),
            onPressed: () {
              index == 0 ? func1() : func2();
            },
          ),
        ),
      );
      return child;
    }).toList()
      ..add(
        FloatingActionButton(
          backgroundColor: Colors.white,
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return Transform(
                  transform:
                      Matrix4.rotationZ(controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: Icon(
                      controller.isDismissed ? Icons.settings : Icons.close,
                      color: Colors.orange));
            },
          ),
          onPressed: () {
            if (controller.isDismissed)
              controller.forward();
            else
              controller.reverse();
          },
        ),
      ),
  );
}

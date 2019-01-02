import 'dart:convert';

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

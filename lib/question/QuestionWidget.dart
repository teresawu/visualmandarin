import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/model/Question.dart';

List<Widget> loadQuestions(Data data) {
  List<Widget> questionCell = [];
  var _splashColor =
      data.answer == 2 ? Colors.green.withAlpha(60) : Colors.red.withAlpha(60);

  var _highlightColor = data.answer == 2
      ? Colors.green.withAlpha(100)
      : Colors.red.withAlpha(100);

  for (int i = 0; i < data.imagesList.length; i++)
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
          print("tapped");
        },
      ),
    ));
  return questionCell;
}

Future<String> loadAsset() async {
  return await rootBundle.loadString(Keys.JSON_PATH_ANIMAL);
}

Future<Question> loadQuestion() async {
  String jsonPage = await loadAsset();
  final jsonResponse = json.decode(jsonPage);
  return await Question.fromJson(jsonResponse);
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/model/Question.dart';

class QuestionView extends StatefulWidget {
  final String title;

  QuestionView({@required this.title}) : super();

  @override
  QuestionViewState createState() => QuestionViewState();
}

class QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(Keys.DARK_GREY),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 25.0),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString(Keys.JSON_PATH_ANIMAL),
            builder: (context, snapshot) {
              var questionData = json.decode(snapshot.data.toString());
//              Question question = Question.fromJson(questionData);
              List<String> list = questionData.map((Map model)=> Question.fromJson(model)).toList();
//              List<String> streetsList = List<String>.from(questionData['image']);
//              question.images = list;
              return new Scaffold(
                appBar: AppBar(
                    title: Text(questionData[0],
                        style: TextStyle(fontSize: 25.0)),
                    backgroundColor: Color(Keys.DARK_GREY),
                    elevation: 0.0,
                    centerTitle: false),
                body: Container(
                  color: Color(Keys.DARK_GREY),
                  child: GridView.count(
                      crossAxisCount: 2, children: loadQuestions(questionData[0])),
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.audiotrack,
                    color: Colors.orange,
                  ),
//        onPressed: sendData,
                ),
              );
            }),
      ),
    );
  }
}

List<Widget> loadQuestions(Question question) {
  List<Widget> questionCell = [];
  var _splashColor = question.answer == 2
      ? Colors.green.withAlpha(60)
      : Colors.red.withAlpha(60);

  var _highlightColor = question.answer == 2
      ? Colors.green.withAlpha(100)
      : Colors.red.withAlpha(100);

  for (int i = 0; i < question.images.length; i++)
    questionCell.add(Card(
      color: Colors.white,
      child: InkWell(
        highlightColor: _highlightColor,
        splashColor: _splashColor,
        child: Center(child: Image(image: AssetImage(question.images[i]))),
        onTap: () {
          print("tapped");
        },
      ),
    ));
  return questionCell;
}

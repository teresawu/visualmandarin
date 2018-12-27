import 'package:flutter/material.dart';
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/model/Question.dart';
import 'package:visualmandarin/question/QuestionWidget.dart';

class QuestionView extends StatefulWidget {
  final String title;

  QuestionView({@required this.title}) : super();

  @override
  QuestionViewState createState() => QuestionViewState();
}

class QuestionViewState extends State<QuestionView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(Keys.DARK_GREY),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 80.0, right: 25.0),
          child: Container(
            child:
                GridView.count(crossAxisCount: 2, children: loadCategories()),
          ),
        ),
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
  }
}

List<Widget> loadCategories() {
  List<Widget> questionCell = [];
  List<Question> questions = questionList();
  for (Question question in questions) {
    questionCell.add(getGridCell(question));
  }
  return questionCell;
}

Card getGridCell(Question question) {
  var _splashColor = question.answer == 2
      ? Colors.green.withAlpha(60)
      : Colors.red.withAlpha(60);

  var _highlightColor = question.answer == 2
      ? Colors.green.withAlpha(100)
      : Colors.red.withAlpha(100);

  return Card(
    color: Colors.white,
    child: InkWell(
      highlightColor: _highlightColor,
      splashColor: _splashColor,
      child: Center(child: Image(image: AssetImage(question.imageA))),
      onTap: () {
        print("tapped");
      },
    ),
  );
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/question/QuestionWidget.dart';

class QuestionView extends StatefulWidget {
  QuestionView() : super();

  @override
  QuestionViewState createState() => QuestionViewState();
}

class QuestionViewState extends State<QuestionView> {
  // AudioCache? audioCache = new AudioCache();

  QuestionViewState() {
    refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(Keys.DARK_GREY),
        child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 25.0),
            child: Scaffold(
                appBar: AppBar(
                    title: AutoSizeText(Keys.data.question!,
                        style: TextStyle(fontSize: 25.0), maxLines: 3),
                    backgroundColor: Color(Keys.DARK_GREY),
                    elevation: 0.0,
                    centerTitle: false),
                body: Container(
                  color: Color(Keys.DARK_GREY),
                  child: GridView.count(
                      crossAxisCount: 2,
                      children: loadQuestions(Keys.data, refreshQuestion)),
                ),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      // audioCache.play(Keys.data.audio);
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.audiotrack,
                      color: Colors.orange,
                    )))));
  }

  void refreshPage() {
    loadQuestion(Keys.PATH).then((val) => setState(() {
          Keys.question = val;
          Keys.data = (Keys.question.data?..shuffle())!.first!;
        }));
  }

  void refreshQuestion() {
    setState(() {
      Keys.data = (Keys.question.data?..shuffle())!.first!;
    });
  }
}

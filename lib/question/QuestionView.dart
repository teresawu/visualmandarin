import 'package:flutter/material.dart';
import 'package:visualmandarin/Keys.dart';
import 'package:visualmandarin/model/Question.dart';
import 'package:visualmandarin/question/QuestionWidget.dart';
import 'package:audioplayers/audio_cache.dart';

class QuestionView extends StatefulWidget {
  final String title;

  QuestionView({@required this.title}) : super();

  @override
  QuestionViewState createState() => QuestionViewState();
}

class QuestionViewState extends State<QuestionView> {
  AudioCache audioCache = new AudioCache();
  Question question;

  QuestionViewState() {
    loadQuestion().then((val) => setState(() {
          question = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(Keys.DARK_GREY),
        child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 25.0),
            child: Scaffold(
                appBar: AppBar(
                    title: Text(question.data[0].question,
                        style: TextStyle(fontSize: 25.0)),
                    backgroundColor: Color(Keys.DARK_GREY),
                    elevation: 0.0,
                    centerTitle: false),
                body: Container(
                  color: Color(Keys.DARK_GREY),
                  child: GridView.count(
                      crossAxisCount: 2,
                      children: loadQuestions(question.data[0])),
                ),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      print("button clicked");
                      audioCache.play(question.data[0].audio);
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.audiotrack,
                      color: Colors.orange,
                    )))));
  }
}

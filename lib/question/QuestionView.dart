import 'package:audioplayers/audio_cache.dart';
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
  AudioCache audioCache = new AudioCache();
  List<Data> dataList;
  Data data;

  QuestionViewState() {
    loadQuestion().then((val) => setState(() {
          Question question = val;
          dataList = question.data;
          refreshAction();
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
                    title:
                        Text(data.question, style: TextStyle(fontSize: 25.0)),
                    backgroundColor: Color(Keys.DARK_GREY),
                    elevation: 0.0,
                    centerTitle: false),
                body: Container(
                  color: Color(Keys.DARK_GREY),
                  child: GridView.count(
                      crossAxisCount: 2, children: loadQuestions(data, refreshAction)),
                ),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      audioCache.play(data.audio);
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.audiotrack,
                      color: Colors.orange,
                    )))));
  }

  void refreshAction() {
    setState(() {
      data = (dataList..shuffle()).first;
    });
  }
}

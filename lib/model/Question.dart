import 'package:meta/meta.dart';

class Question {
  int id;
  String title;
  String imageA;
  String imageB;
  String imageC;
  String imageD;
  String question;
  int answer;

  Question(
      {@required this.id,
      @required this.title,
      @required this.imageA,
      @required this.imageB,
      @required this.imageC,
      @required this.imageD,
      @required this.question,
      @required this.answer});
}

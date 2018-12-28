//class Question {
//  List<String> images;
//  final String question;
//  final int answer;
//  final String audio;
//
//  Question(this.question, this.answer, this.audio, this.images);
//
//  Question.fromJson(Map<String, dynamic> json)
//      : question = json['question'],
//        answer = json['answer'],
//        audio = json['audio'],
//        images = json['images'];
//
//  Map<String, dynamic> toJson() => {
//        'question': question,
//        'answer': answer,
//        'audio': audio,
//        'image': image
//      };
//}
//

class Question {
  List<String> images;
  final String question;
  final int answer;
  final String audio;

  Question({this.question, this.answer, this.audio, this.images});

  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    var questionFromJson = parsedJson['image'];
    List<String> imageList = questionFromJson.cast<String>();

    return new Question(
        question: parsedJson['question'],
        answer: parsedJson['answer'],
        audio: parsedJson['audio'],
        images: parsedJson['images'];
    );
  }
}
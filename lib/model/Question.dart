class Question {
  int? index;
  List<Data>? data;

  Question({this.index, this.data});

  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<Data> data = list.map((i) => Data.fromJson(i)).toList();
    return Question(index: parsedJson['index'], data: data);
  }
}

class Data {
  String? question;
  int? answer;
  String? audio;
  List<String>? imagesList;

  Data({this.question, this.answer, this.audio, this.imagesList});

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    var picFromJson = parsedJson['picture'];
    List<String> imgList = new List<String>.from(picFromJson);
    return Data(
        question: parsedJson['question'],
        answer: parsedJson['answer'],
        audio: parsedJson['audio'],
        imagesList: imgList);
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:visualmandarin/model/Question.dart';
import 'package:visualmandarin/Keys.dart';
import 'package:flutter/services.dart' show rootBundle;

List<Question> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Question>((json) => Question.fromJson(json)).toList();
}

Future<String> awaitLoading() async {
  return await rootBundle.loadString(Keys.JSON_PATH_ANIMAL);
}

Future loadQuestion() async {
  final jsonResponse = json.decode(await awaitLoading());
  Question question = new Question.fromJson(jsonResponse);
}

factory Question.fromJson(Map<String, dynamic> parsedJson) {
return new Question(
question: parsedJson['question'],
answer: parsedJson['answer'],
audio: parsedJson['audio'],
images: parsedJson['images'];
);
}
import 'package:flutter/material.dart';
import 'package:visualmandarin/model/Question.dart';

Container imageColumn() {
  return Container(
    decoration: BoxDecoration(color: Colors.black12),
    padding: EdgeInsets.all(4.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            getExpandedImage('data/image/animal_1.jpg'),
            getExpandedImage('data/image/animal_2.jpg')
          ],
        ),
        Row(
          children: <Widget>[
            getExpandedImage('data/image/animal_3.jpg'),
            getExpandedImage('data/image/animal_4.jpg')
          ],
        )
      ],
    ),
  );
}

Expanded getExpandedImage(String imagePath) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: 5.0, color: Colors.black26),
          borderRadius: const BorderRadius.all(const Radius.circular(8.0))),
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(imagePath, fit: BoxFit.fill),
    ),
  );
}

List<Question> questionList() {
  return [
    Question(
        id: 0,
        title: 'Animal',
        imageA: 'data/image/animala.jpg',
        imageB: 'data/image/animalb.jpg',
        imageC: 'data/image/animalc.jpg',
        imageD: 'data/image/animald.jpg',
        question: 'Tiger',
        answer: 1),
    Question(
        id: 0,
        title: 'Animal',
        imageA: 'data/image/animala.jpg',
        imageB: 'data/image/animalb.jpg',
        imageC: 'data/image/animalc.jpg',
        imageD: 'data/image/animald.jpg',
        question: 'Tiger',
        answer: 2),
    Question(
        id: 0,
        title: 'Animal',
        imageA: 'data/image/animala.jpg',
        imageB: 'data/image/animalb.jpg',
        imageC: 'data/image/animalc.jpg',
        imageD: 'data/image/animald.jpg',
        question: 'Tiger',
        answer: 3),
    Question(
        id: 0,
        title: 'Animal',
        imageA: 'data/image/animala.jpg',
        imageB: 'data/image/animalb.jpg',
        imageC: 'data/image/animalc.jpg',
        imageD: 'data/image/animald.jpg',
        question: 'Tiger',
        answer: 4)
  ];
}

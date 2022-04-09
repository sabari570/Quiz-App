import 'package:flutter/material.dart';

class QuestionModel {
  var question;
  var correctAnswer;
  List<dynamic> shuffledOptions;
  QuestionModel({
    this.question,
    this.correctAnswer,
    this.shuffledOptions,
  });
}

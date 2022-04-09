import 'package:flutter_quizz/models/questions_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class QuestionInfo {
  List<dynamic> options;
  List<QuestionModel> quizQuestions = new List<QuestionModel>();
  Future<void> getQuestions(int categoryNum, String difficultyLevel) async {
    String question;
    String correctAnswer;
    List<dynamic> incorrectAnswers;
    String difficulty = difficultyLevel;
    String category = categoryNum.toString();
    try {
      String url =
          'https://opentdb.com/api.php?amount=10&category=$category&difficulty=$difficulty&type=multiple';
      var response = await get(Uri.parse(url));

      var jsonData = jsonDecode(response.body);
      print('JsonData: $jsonData');
      if (jsonData['response_code'] == 0) {
        jsonData['results'].forEach(
          (element) {
            question = element['question'];
            if (question.contains('&#039;')) {
              question = question.replaceAll('&#039;', "'");
            }
            if (question.contains('&quot;')) {
              question = (question.replaceAll('&quot;', '"'));
              print('Modified question: $question');
            }
            correctAnswer = element['correct_answer'];
            incorrectAnswers = element['incorrect_answers'];
            print('IncorrectAnswers: $incorrectAnswers');
            options = incorrectAnswers;
            options[0] = incorrectAnswers[0].toString();
            options[1] = incorrectAnswers[1].toString();
            options[2] = incorrectAnswers[2].toString();
            options.add(correctAnswer);
            options[3] = incorrectAnswers[3].toString();
            if (options[0].contains('&#039;')) {
              options[0] = options[0].replaceAll('&#039;', "'");
            }
            if (options[0].contains('&quot;;')) {
              options[0] = options[0].replaceAll('&quot;', '"');
            }
            if (options[1].contains('&#039;')) {
              options[1] = options[1].replaceAll('&#039;', "'");
            }
            if (options[1].contains('&quot;;')) {
              options[1] = options[1].replaceAll('&quot;', '"');
            }
            if (options[2].contains('&#039;')) {
              options[2] = options[2].replaceAll('&#039;', "'");
            }
            if (options[2].contains('&quot;;')) {
              options[2] = options[2].replaceAll('&quot;', '"');
            }
            if (options[3].contains('&#039;')) {
              options[3] = options[3].replaceAll('&#039;', "'");
            }
            if (options[3].contains('&quot;;')) {
              options[3] = options[3].replaceAll('&quot;', '"');
            }
            options.shuffle();
            print('Options: $options');
            quizQuestions.add(QuestionModel(
              question: question,
              correctAnswer: correctAnswer,
              shuffledOptions: options,
            ));
          },
        );
      }
    } catch (e) {
      print('Exception is: $e');
    }
  }
}

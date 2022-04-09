import 'package:flutter/material.dart';
import 'package:flutter_quizz/build_list/build_options.dart';
import 'package:flutter_quizz/screens/questions.dart';

class QuestionTile extends StatefulWidget {
  final String quizQuestion;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctAnswer;
  QuestionTile({
    this.quizQuestion,
    this.optionA,
    this.optionB,
    this.optionC,
    this.optionD,
    this.correctAnswer,
  });
  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  bool _isAnswered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[600]),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.quizQuestion,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_isAnswered == false) {
                    if (widget.optionA == widget.correctAnswer) {
                      setState(() {
                        _isAnswered = true;
                        correct = correct + 1;
                        notAnswered = notAnswered - 1;
                        print('Total: $total');
                        print('\nCorrect: $correct');
                        print('\nIncorrect: $incorrect');
                        print('\nNotAnswered: $notAnswered');
                      });
                    } else {
                      setState(() {
                        _isAnswered = true;
                        incorrect = incorrect + 1;
                        notAnswered = notAnswered - 1;
                        print('Total: $total');
                        print('\nCorrect: $correct');
                        print('\nIncorrect: $incorrect');
                        print('\nNotAnswered: $notAnswered');
                      });
                    }
                  }
                },
                child: OptionTile(
                  optionName: 'A',
                  optionDescription: widget.optionA,
                  correctAnswer: widget.correctAnswer,
                  optionSelected: _isAnswered,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_isAnswered == false) {
                    if (widget.optionB == widget.correctAnswer) {
                      setState(() {
                        _isAnswered = true;
                        correct = correct + 1;
                        notAnswered = notAnswered - 1;
                      });
                    } else {
                      setState(() {
                        _isAnswered = true;
                        incorrect = incorrect + 1;
                        notAnswered = notAnswered - 1;
                      });
                    }
                  }
                },
                child: OptionTile(
                  optionName: 'B',
                  optionDescription: widget.optionB,
                  correctAnswer: widget.correctAnswer,
                  optionSelected: _isAnswered,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_isAnswered == false) {
                    if (widget.optionC == widget.correctAnswer) {
                      setState(() {
                        _isAnswered = true;
                        correct = correct + 1;
                        notAnswered = notAnswered - 1;
                      });
                    } else {
                      setState(() {
                        _isAnswered = true;
                        incorrect = incorrect + 1;
                        notAnswered = notAnswered - 1;
                      });
                    }
                  }
                },
                child: OptionTile(
                  optionName: 'C',
                  optionDescription: widget.optionC,
                  correctAnswer: widget.correctAnswer,
                  optionSelected: _isAnswered,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_isAnswered == false) {
                    if (widget.optionD == widget.correctAnswer) {
                      setState(() {
                        _isAnswered = true;
                        correct = correct + 1;
                        notAnswered = notAnswered - 1;
                      });
                    } else {
                      setState(() {
                        _isAnswered = true;
                        incorrect = incorrect + 1;
                        notAnswered = notAnswered - 1;
                      });
                    }
                  }
                },
                child: OptionTile(
                  optionName: 'D',
                  optionDescription: widget.optionD,
                  correctAnswer: widget.correctAnswer,
                  optionSelected: _isAnswered,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

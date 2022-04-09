import 'package:flutter/material.dart';
import 'package:flutter_quizz/screens/questions.dart';

class OptionTile extends StatefulWidget {
  final String optionName;
  final String optionDescription;
  final String correctAnswer;
  bool optionSelected = false;

  OptionTile({
    this.optionName,
    this.optionDescription,
    this.correctAnswer,
    this.optionSelected,
  });

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  Color _correctOptionColor = Colors.green[400];
  Color _inCorrectOptionColor = Colors.red;
  Color _correctBorderColor = Colors.greenAccent;
  Color _incorrectBorderColor = Colors.redAccent;
  Color _correctTextColor = Colors.white;
  Color _incorrectTextcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: widget.optionSelected
                  ? widget.optionDescription == widget.correctAnswer
                      ? _correctOptionColor
                      : _inCorrectOptionColor
                  : Colors.white,
              border: Border.all(
                color: widget.optionSelected
                    ? widget.optionDescription == widget.correctAnswer
                        ? _correctBorderColor
                        : _incorrectBorderColor
                    : Colors.black,
              ),
              shape: BoxShape.circle,
            ),
            child: Text(
              widget.optionName,
              style: TextStyle(
                color: widget.optionSelected
                    ? widget.optionDescription == widget.correctAnswer
                        ? _correctTextColor
                        : _incorrectTextcolor
                    : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              widget.optionDescription,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_screen.dart';

// ignore: must_be_immutable
class MathQuiz extends StatelessWidget {
  List<Question> mathQuestions = [
    Question(
      'What is 2 + 2?',
      ['3', '4', '5', '6'],
      '4',
    ),
    Question(
      'What is 8 - 3?',
      ['2', '3', '5', '6'],
      '5',
    ),
    Question(
      'What is 10 * 5?',
      ['50', '40', '30', '20'],
      '50',
    ),
    Question(
      'What is 16 / 4?',
      ['2', '4', '6', '8'],
      '4',
    ),
    Question(
      'What is the square root of 81?',
      ['9', '8', '7', '6'],
      '9',
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizScreen(quizTitle: 'Math Quiz', questions: mathQuestions),
    );
  }
}
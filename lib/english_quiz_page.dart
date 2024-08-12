import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_screen.dart';

// ignore: must_be_immutable
class EnglishQuiz extends StatelessWidget {
  List<Question> englishQuestions = [
    Question(
      'What is the capital of the United Kingdom?',
      ['Paris', 'Berlin', 'Madrid', 'London'],
      'London',
    ),
    Question(
      'Who wrote "Romeo and Juliet"?',
      ['William Shakespeare', 'Jane Austen', 'Charles Dickens', 'Mark Twain'],
      'William Shakespeare',
    ),
    Question(
      'What is the largest planet in our solar system?',
      ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'Jupiter',
    ),
    Question(
      'Who is the author of "To Kill a Mockingbird"?',
      ['Harper Lee', 'J.K. Rowling', 'George Orwell', 'Ernest Hemingway'],
      'Harper Lee',
    ),
    Question(
      'In which year did World War II end?',
      ['1943', '1945', '1950', '1939'],
      '1945',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: QuizScreen(quizTitle: 'English Quiz', questions: englishQuestions),
    );
  }
}
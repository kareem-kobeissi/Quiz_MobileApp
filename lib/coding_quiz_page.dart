import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_screen.dart';

class CodingQuiz extends StatelessWidget {List<Question> codingQuestions = [
  Question(
    'What is the main purpose of a constructor in programming?',
    ['To allocate memory', 'To initialize an object', 'To define a class', 'To declare a variable'],
    'To initialize an object',
  ),
  Question(
    'What does HTML stand for?',
    ['Hypertext Markup Language', 'High-Level Text Modeling Language', 'Hyperlink and Text Markup Language', 'Hypertext Modeling Language'],
    'Hypertext Markup Language',
  ),
  Question(
    'Which programming language is known for its use in data science and machine learning?',
    ['Java', 'Python', 'C++', 'Ruby'],
    'Python',
  ),
  Question(
    'What is the purpose of the "git clone" command?',
    ['To create a new branch', 'To copy a repository', 'To delete a file', 'To merge branches'],
    'To copy a repository',
  ),
  Question(
    'What is the output of the following code: print("Hello, World!")',
    ['Hello, World!', 'World', 'Error', 'Null'],
    'Hello, World!',
  ),
];
@override
Widget build(BuildContext context) {
  return Scaffold(

    body: QuizScreen(quizTitle: 'Coding Quiz', questions: codingQuestions),
  );
}
}
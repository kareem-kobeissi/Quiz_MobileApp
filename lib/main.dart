import 'package:flutter/material.dart';
import 'english_quiz_page.dart';
import 'math_quiz_page.dart';
import 'coding_quiz_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),




      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnglishQuiz(),
                  ),
                );
              },
              child: Text('English Quiz'),
            ),
            SizedBox(height: 10), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MathQuiz(),
                  ),
                );
              },
              child: Text('Math Quiz'),
            ),
            SizedBox(height: 10), // Add space between buttons
            ElevatedButton(

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CodingQuiz(),
                  ),
                );
              },
              child: Text('Coding Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

// quiz_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'question.dart';

class QuizScreen extends StatefulWidget {
  final String quizTitle;
  final List<Question> questions;

  QuizScreen({required this.quizTitle, required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

//state class managing the state of the quiz screen
class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  int _triesLeft = 3;
  int _currentPage = 0;
  late Timer _timer;
  int _timeRemaining = 0;
  late PageController _pageController;
//State Variable include the score tries left current page timer  time remaining and a page control for the page views
  @override
  //
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timeRemaining = 4 * widget.questions.length; //
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _timer.cancel();
          if (_currentPage < widget.questions.length - 1) {
            _nextQuestion();
          } else {
            _showResults();
          }
        }
      });
    });
  }

  void _startQuiz() {
    setState(() {
      _currentPage = 0;
      score = 0;
      _triesLeft = 3;
      _timeRemaining = 4 * widget.questions.length; // Reset time remaining
      _startTimer(); // Restart the timer when restarting the quiz
    });
  }

  void checkAnswer(String selectedAnswer) {
    if (_currentPage < widget.questions.length && _timeRemaining > 0) {
      String correctAnswer = widget.questions[_currentPage].correctAnswer;

      if (selectedAnswer == correctAnswer) {
        setState(() {
          score++;
          _triesLeft = 3; // Reset tries for the next question
        });
        _showSnackbar('Good job! Keep going.', Colors.green);

        // Automatically move to the next question after a correct answer
        _nextQuestion();
      } else {
        setState(() {
          _triesLeft--;
        });
        if (_triesLeft == 0) {
          _showSnackbar(
              'Incorrect. No more tries. Moving to the next question.',
              Colors.red);
          _nextQuestion();
        } else {
          _showSnackbar('Incorrect. $_triesLeft tries left.', Colors.red);
        }
      }
    }
  }

  void _nextQuestion() {
    setState(() {
      _currentPage++;
    });

    if (_currentPage == widget.questions.length) {
      _showResults();
    } else {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
  //displays alert Dialog when the quiz is completed showing the user score
  //to provides options to restart the quiz or go back to the main page .
  void _showResults() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('Your score: $score / ${widget.questions.length}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startQuiz();
              },
              child: Text('Restart Quiz'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Go back to the main page
              },
              child: Text('Go Back to Main Page'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: color!,
      ),
    );
  }

  @override
  // we build the method of Quiz Screen widget.
  //to sets up structure of the quiz screen with an optional app bar displaying the quiz title
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.quizTitle.isNotEmpty
          ? AppBar(
        title: Text(widget.quizTitle),
        backgroundColor: Colors.grey[300]!,
      )
          : null,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Time remaining: $_timeRemaining seconds',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          //here to control the page to next question in controller
          Expanded(
            child: _timeRemaining > 0
                ? PageView.builder(
              // Only show questions if there's time remaining
              itemCount: widget.questions.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Question ${index + 1}/${widget.questions.length}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[800]!,
                        ),
                        child: Text(
                          widget.questions[index].questionText,
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      ...widget.questions[index].options.map((option) {
                        return ElevatedButton(
                          onPressed: () => checkAnswer(option),
                          child: Text(option),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            )
                : Center(
              child: Text(
                'Time is up! Quiz not completed.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
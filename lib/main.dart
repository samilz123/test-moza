import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import 'result.dart';
/*void main() {
  runApp(MyApp());
}*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 4},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': "What's your favorite animal ?",
      'answers': [
        {'text': 'Horse', 'score': 10},
        {'text': 'Cat', 'score': 7},
        {'text': 'Dog', 'score': 4},
        {'text': 'Fish', 'score': 1},
      ],
    },
    {
      'questionText': "What's your favorite country ?",
      'answers': [
        {'text': 'China', 'score': 10},
        {'text': 'Greece', 'score': 7},
        {'text': 'Singapore', 'score': 4},
        {'text': 'USA', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print('Answer chosen!');
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else
      print('finished!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first appp'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

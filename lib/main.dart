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
  final List<Map<String, Object>> _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': "What's your favorite animal ?",
      'answers': ['Sheep', 'Horse', 'Snake', 'Dog'],
    },
    {
      'questionText': "What's your favorite country ?",
      'answers': ['Tunisia', 'Germany', 'Russia', 'USA'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}

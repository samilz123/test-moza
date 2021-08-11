import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print('Answer chosen!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const List questions = const [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first appp'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}

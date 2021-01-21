import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who\'s the President of USA',
      'answers': [
        {'text': 'JOE BIDEN', 'score': 10},
        {'text': 'DONALD TRUMP', 'score': 5},
        {'text': 'HILLARY CLINTON', 'score': 3},
        {'text': 'GEORGE BUSH', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s the Prime Minister of Nepal ?',
      'answers': [
        {'text': 'BHIMSEN THAPPA', 'score': 3},
        {'text': 'KP SHARMA OLI', 'score': 11},
        {'text': 'DAMODAR PANDE', 'score': 5},
        {'text': 'RANA BAHADUR SHAH', 'score': 6},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 4},
        {'text': 'Eric', 'score': 0},
        {'text': 'Matt', 'score': 1},
        {'text': 'Robert', 'score': 0},
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
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('My First App')
        ),
        body: _questionIndex < _questions.length
            ? Quiz (
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}


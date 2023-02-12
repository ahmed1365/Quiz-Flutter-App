import 'package:flutter/material.dart';
import 'package:flutter_app/quiz.dart';
import 'package:flutter_app/result.dart';
import 'question.dart';
import 'answer.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  int _questionIndex = 0;

  int num0 = 0, num1 = 0, num2 = 0, num3 = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
      num3 = 0;
    });
  }

  void answerQuestion(score) {
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2)
      num2 = score;
    else if (_questionIndex == 3) num3 = score;

    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print("_questiomIndex=$_questionIndex");
    print("num0=$num0");
    print("num1=$num1");
    print("num2=$num2");
    print("num3=$num3");

    print("totalScore=$_totalScore");
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What is your favorite Team ?',
      'answers': [
        {'text': 'Real Madrid', 'score': 40},
        {'text': 'Manchester United', 'score': 20},
        {'text': 'Barcelona', 'score': 30},
        {'text': 'Liverpool', 'score': 30},
      ]
    },
    {
      'questionText': 'What is your favorite Player ?',
      'answers': [
        {'text': 'Ronaldo', 'score': 30},
        {'text': 'Messi', 'score': 40},
        {'text': 'Mpabe', 'score': 20},
        {'text': 'MO Salah', 'score': 30}
      ]
    },
    {
      'questionText': 'What is your favorite league ?',
      'answers': [
        {'text': 'praimer league', 'score': 30},
        {'text': 'Egyptian league', 'score': 20},
        {'text': 'La lega', 'score': 40},
        {'text': 'Boundous League', 'score': 10}
      ]
    },
    {
      'questionText': 'What is your favorite local team ?',
      'answers': [
        {'text': 'Zamalek', 'score': 100},
        {'text': ' Ahly ', 'score': 0},
        {'text': 'Ismaily', 'score': 30},
        {'text': 'Pyramids', 'score': 20},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz of  Favorites"),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
        body: Container(
            color: Colors.black,
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalScore)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            if (_questionIndex == 1) _totalScore -= num0;
            if (_questionIndex == 2) _totalScore -= num1;
            if (_questionIndex == 3) _totalScore -= num2;
            if (_questionIndex == 4) _totalScore -= num3;

            setState(() {
              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });
            print("_questiomIndex=$_questionIndex");
            print("num=$num");
            print("totalScore=$_totalScore");
          },
        ),
      ),
    );
  }
}

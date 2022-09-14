import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final int _quizEndIndex = 2;
  int _questionIndex = 0;
  int _correctAnswers = 0;
  int _incorrectAnswers = 0;
  String _answer = '';
  List<QuestionSet> questionList = [];
  var answerColor = Colors.white;

  void fillList() {
    questionList.add(QuestionSet('What is the rarest M&M color?', 'Red',
        'Brown', 'Blue', 'Green', 'Brown'));
    questionList.add(QuestionSet(
        'Which country consumes the most chocolate per capita?',
        'France',
        'Italy',
        'Switzerland',
        'Germany',
        'Switzerland'));

    questionList.add(QuestionSet(
        'You have finished the quiz!',
        'Your number of correct answers',
        _correctAnswers.toString(),
        'Your number of incorrect answers',
        _incorrectAnswers.toString(),
        ' '));
  }

  @override
  Widget build(BuildContext context) {
    fillList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: 30,
                width: 400,
                child: Text(
                  questionList[_questionIndex].question,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              answerBox(questionList[_questionIndex].ans1),
              const SizedBox(height: 10),
              answerBox(questionList[_questionIndex].ans2),
              const SizedBox(height: 10),
              answerBox(questionList[_questionIndex].ans3),
              const SizedBox(height: 10),
              answerBox(questionList[_questionIndex].ans4),
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: 30,
                width: 300,
                child: const Text(
                  'This is your answer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                color: answerColor,
                height: 50,
                width: 300,
                child: Text(
                  _answer,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 70),
              Container(
                //color: Colors.blue,
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  child: Text('Next Question'),
                  onPressed: () {
                    setState(() => _questionIndex++);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget answerBox(String name) {
    //fillList();
    return Container(
      //alignment: Alignment.center,
      height: 50,
      width: 300,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
        ),
        child: Text(name),
        onPressed: () {
          setState(() {
            _answer = name;
            if (name == questionList[_questionIndex].correctAns) {
              print('Correct!');
              answerColor = Colors.lightGreen;
              _correctAnswers++;
              questionList[_quizEndIndex].ans2 = _correctAnswers.toString();
              fillList();
              //print(questionList[quizEndIndex].ans2.toString());
            } else {
              print('False, try again.');
              answerColor = Colors.red;
              _incorrectAnswers++;
              questionList[_quizEndIndex].ans4 = _incorrectAnswers.toString();
              fillList();
              //print(questionList[quizEndIndex].ans4.toString());
            }
          });
        },
      ),
    );
  }
}

class QuestionSet {
  String question = '';
  String ans1 = '';
  String ans2 = '';
  String ans3 = '';
  String ans4 = '';
  String correctAns = '';

  QuestionSet(
    this.question,
    this.ans1,
    this.ans2,
    this.ans3,
    this.ans4,
    this.correctAns,
  );
}

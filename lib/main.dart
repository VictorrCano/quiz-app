import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIndex = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  String answer = '';
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
        correctAnswers.toString(),
        'Your number of incorrect answers',
        incorrectAnswers.toString(),
        ''));
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
                height: 40,
                width: 400,
                child: Text(
                  questionList[questionIndex].question,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              answerBox(questionList[questionIndex].ans1),
              const SizedBox(height: 10),
              answerBox(questionList[questionIndex].ans2),
              const SizedBox(height: 10),
              answerBox(questionList[questionIndex].ans3),
              const SizedBox(height: 10),
              answerBox(questionList[questionIndex].ans4),
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: 40,
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
                  answer,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 70),
              Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 50,
                width: 300,
                child: SizedBox(
                  height: double.infinity, //<- match height of parent (50)
                  width: double.infinity, //<- match width of parent (300)
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    child: Text('Next Question'),
                    onPressed: () {
                      setState(() => questionIndex++);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget answerBox(String name) {
    fillList();
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 50,
      width: 300,
      child: SizedBox(
        height: double.infinity, //<- match height of parent (50)
        width: double.infinity, //<- match width of parent (300)
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
          ),
          child: Text(name),
          onPressed: () {
            setState(() {
              answer = name;
              if (name == questionList[questionIndex].correctAns) {
                print('Correct!');
                answerColor = Colors.lightGreen;
                correctAnswers++;
                questionList[questionList.length - 1].ans2 =
                    correctAnswers.toString();
                print(questionList[questionList.length - 1].ans2.toString());
              } else {
                print('False, try again.');
                answerColor = Colors.red;
                incorrectAnswers++;
                questionList[questionList.length - 1].ans4 =
                    incorrectAnswers.toString();
                print(questionList[questionList.length - 1].ans4.toString());
              }
            });
          },
        ),
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

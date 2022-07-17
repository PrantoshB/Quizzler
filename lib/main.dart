import 'package:flutter/material.dart';
import 'package:quizzler/quiz-brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> SetIcon = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(quesNum),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAns = quizBrain.getAns(quesNum);
                if (correctAns == true) {
                  SetIcon.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  SetIcon.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                ;
                setState(() {
                  quizBrain.setQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAns = quizBrain.getAns(quesNum);
                if (correctAns == false) {
                  SetIcon.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  SetIcon.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                ;
                setState(() {
                  quizBrain.setQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: SetIcon,
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/Utilities/questions.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key, required this.switchScreen});

  final void Function() switchScreen;

  @override
  State<QuizzesScreen> createState() {
    return _QuizzesScreen(switchScreen);
  }
}

class _QuizzesScreen extends State<QuizzesScreen> {
  _QuizzesScreen(this.switchScreen);

  final void Function() switchScreen;

  var index = 0;

  void pickAnswer() {
    if (index == questions.length - 1) {
      switchScreen();
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(questions[index].question,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center),
      AnswersButton(title: questions[index].answers[0], pickAnswer: pickAnswer),
      AnswersButton(title: questions[index].answers[1], pickAnswer: pickAnswer),
      AnswersButton(title: questions[index].answers[2], pickAnswer: pickAnswer),
      AnswersButton(title: questions[index].answers[3], pickAnswer: pickAnswer)
    ]);
  }
}

class AnswersButton extends StatelessWidget {
  const AnswersButton(
      {super.key, required this.title, required this.pickAnswer});

  final String title;
  final void Function() pickAnswer;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          pickAnswer();
        },
        style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blueAccent,
            textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
        child: Text(title));
  }
}

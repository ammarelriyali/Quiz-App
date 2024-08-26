import 'package:flutter/material.dart';
import 'package:task_app/Utilities/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key, required this.switchScreen});

  final void Function(List<String> arr) switchScreen;

  @override
  State<QuizzesScreen> createState() {
    return _QuizzesScreen();
  }
}

class _QuizzesScreen extends State<QuizzesScreen> {



  var index = 0;
  final List<String> arr=[];
  void pickAnswer(String i) {
    arr.add(i);
    if (index == questions.length - 1) {
      widget.switchScreen(arr);
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> shuffledAnswers=questions[index].shuffledAnswers;
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Text(questions[index].question,
              style:  GoogleFonts.oswald(fontSize: 20, color: Colors.white ),
              textAlign: TextAlign.center),
          const SizedBox(height: 40,),
          AnswersButton(title: shuffledAnswers[0], pickAnswer: pickAnswer),
          AnswersButton(title: shuffledAnswers[1], pickAnswer: pickAnswer),
          AnswersButton(title: shuffledAnswers[2], pickAnswer: pickAnswer),
          AnswersButton(title: shuffledAnswers[3], pickAnswer: pickAnswer)
        ]),
      ),
    );
  }
}

class AnswersButton extends StatelessWidget {
  const AnswersButton(
      {super.key, required this.title, required this.pickAnswer});

  final String title;
  final void Function(String i) pickAnswer;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          pickAnswer(title);
        },
        style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(8),
            foregroundColor: Colors.blueAccent,
            backgroundColor: Colors.white60,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
        child: Text(title,textAlign: TextAlign.center,));
  }
}

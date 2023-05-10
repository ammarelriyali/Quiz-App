import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/Utilities/questions.dart';
import 'package:task_app/questions_summary/summary_result.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.answers, super.key, required this.switchScreen});

  final void Function() switchScreen;
  final List<String> answers;

  List<Map<String, Object>> getMapAnswers() {
    final List<Map<String, Object>> res = [];
    for (var i = 0; i < answers.length; i++) {
      res.add({
        'index': i,
        'question': questions[i].question,
        'answer': questions[i].answers[0],
        'user answer': answers[i],
      });
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    int numberOfCorrectedAnswer = getMapAnswers()
        .where((element) =>
            (element['answer'] as String) == (element['user answer'] as String))
        .length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You answered $numberOfCorrectedAnswer of ${getMapAnswers().length} questions correctly!",
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        SummaryResult(res: getMapAnswers()),
        OutlinedButton.icon(
            onPressed: () {
              switchScreen();
            },
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(8),
                foregroundColor: Colors.blueAccent,
                textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
            icon: const Icon(Icons.restart_alt),
            label: const Text(
              "Restart",
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}

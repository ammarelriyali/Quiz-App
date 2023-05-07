import 'package:flutter/material.dart';
import 'package:task_app/EnterScreen.dart';
import 'package:task_app/QuizzesScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var currentScreen = "Enter Screen";

  @override
  Widget build(BuildContext context) {
    print("object--------------");
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
          child: (currentScreen == "Enter Screen")
              ? EnterScreen(() {
                  setState(() {
                    currentScreen = "Quizzes Screen";
                  });
                })
              : const QuizzesScreen()),
    )));
  }
}

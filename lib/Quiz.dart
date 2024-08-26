import 'package:flutter/material.dart';
import 'package:task_app/enter_screen.dart';
import 'package:task_app/quizzes_screen.dart';
import 'package:task_app/result_screen.dart';
import 'package:task_app/Utilities/screen_names_enum.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  
  ScreensEnum currentScreen = ScreensEnum.enter;
  List<String> answers = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(child: getCurrentScreen()),
    )));
  }

  void _enterScreenCallback() {
    setState(() {
      currentScreen = ScreensEnum.quizzes;
    });
  }

  void _quizzesScreenCallback(List<String> arr) {
    setState(() {
      currentScreen = ScreensEnum.result;
      answers = arr;
    });
  }

  void _resultScreenCallback() {
    setState(() {
      currentScreen = ScreensEnum.enter;
    });
  }

  Widget? getCurrentScreen() {
    switch (currentScreen) {
      case ScreensEnum.enter:
        return EnterScreen(_enterScreenCallback);

      case ScreensEnum.quizzes:
        return QuizzesScreen(switchScreen: _quizzesScreenCallback);

      case ScreensEnum.result:
        return ResultScreen(switchScreen: _resultScreenCallback,
         answers: answers);
    }
  }
}
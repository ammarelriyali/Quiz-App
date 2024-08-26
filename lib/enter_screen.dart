import 'package:flutter/material.dart';

class EnterScreen extends StatelessWidget{
  const EnterScreen(this.switchScreen, {super.key});
  final void Function() switchScreen ;
  @override
  Widget build(BuildContext context) {
    return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "assets/images/quiz-logo.png",
                width: 300,
                color: const Color.fromARGB(150, 255, 255, 255)
            ),
            const SizedBox(
              height: 60,
            ),
            const Text("Learn Flutter The Fun Way!",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
                onPressed: () {switchScreen();},
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16)),
                icon: const Icon(
                  Icons.arrow_right_alt_outlined,
                ),
                label: const Text(
                  "Start Quiz",
                )
            )
          ],
        );

  }


}
import 'package:flutter/material.dart';
import 'package:test_app/widgets/styles_text.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              height: 300,
              // best practice
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            // Opacity(
            //   opacity: 0.5,
            //   child: Image.asset(
            //     'assets/images/quiz-logo.png',
            //     width: 300,
            //     height: 300,
            //   ),
            // ),
            const SizedBox(
              height: 60,
            ),
            const StyledText('Learn Flutter The Fun Way!'),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: OutlinedButton.icon(
                onPressed: startQuiz,
                style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                label: const Text('Start Quiz'),
                icon: const Icon(Icons.arrow_right_alt),
              ),
            )
          ],
        ),
      ),
    );
  }
}

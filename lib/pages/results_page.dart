import 'package:flutter/material.dart';
import 'package:test_app/data/questions.dart';
import 'package:test_app/data/questions_summary.dart';
import 'package:test_app/widgets/styles_text.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getResults() {
    final List<Map<String, Object>> results = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      results.add({
        'question_index': i,
        'question': questions[i].text,
        'correct': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getResults();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summeryData
        .where((data) => data['correct'] == data['user_answer'])
        .length;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: StyledText(
                    'You answered $numCorrectQuestions out of $numTotalQuestions corectly!'),
              ),
              const SizedBox(
                height: 40,
              ),
              QuestionsSummary(summeryData),
              const SizedBox(
                height: 40,
              ),
              Builder(
                builder: (BuildContext context) {
                  return TextButton.icon(
                      style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(123, 82, 100, 202)),
                      ),
                      onPressed: () {
                        onRestart();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Restart Quiz'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

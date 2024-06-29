import 'package:flutter/material.dart';
import 'package:test_app/data/questions.dart';
import 'package:test_app/pages/home_page.dart';
import 'package:test_app/pages/questions_page.dart';
import 'package:test_app/pages/results_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> selectedAnswers = [];

  var activeScreen = 'home-page';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-page';
    });
  }

  chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-page';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'results-page') {
      return ResultsPage(
          chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }
    return MaterialApp(
      title: 'TestApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: activeScreen == 'home-page'
          ? HomePage(switchScreen)
          : QuestionPage(
              onSelectAnswer: chooseAnswer,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/widgets/button.dart';
import 'package:test_app/widgets/styles_text.dart';
import 'package:test_app/data/questions.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: StyledText(currentQuestion.text),
              ),
              const SizedBox(
                height: 40,
              ),
              ...currentQuestion.getShffledAnswers().map((answer) {
                return Button(
                  answer,
                  () {
                    answerQuestion(answer);
                  },
                );
              }),
              // ...currentQuestion.answers.map((e) =>
              // AnswerButton(e,() {})),
              // under is the same of the above
              // AnswerButton(currentQuestion.answers[0], () {}),
              // AnswerButton(currentQuestion.answers[1], () {}),
              // AnswerButton(currentQuestion.answers[2], () {}),
              // AnswerButton(currentQuestion.answers[3], () {}),
            ],
          ),
        ),
      ),
    );
  }
}

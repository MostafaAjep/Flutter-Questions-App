import 'package:flutter/material.dart';
import 'package:test_app/pages/quiz_page.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const QuizPage();
  }
}

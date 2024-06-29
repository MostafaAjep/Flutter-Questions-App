class QuizQuestions {
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShffledAnswers() {
    //  of make a new copy of exsisting list
    // shuffle change the original list while map make a new list of its own
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

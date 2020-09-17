class Question {
  String questionText;
  bool questionAnswer;

  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }

  bool isCorrect(bool value) {
    if (questionAnswer == value) {
      return true;
    }
    return false;
  }
}

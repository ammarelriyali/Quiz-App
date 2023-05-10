class QuizQuestion{
  QuizQuestion(this.question,this.answers) ;
 String question ;
  List<String> answers;
  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
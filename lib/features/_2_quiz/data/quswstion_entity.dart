class QuestionEntitiy {
  final int id;
  final String question;
  final List<String> asnwers;
  final List<String> correctAnswers;
  final String difficulty;

  QuestionEntitiy({
    required this.id,
    required this.question,
    required this.asnwers,
    required this.correctAnswers,
    required this.difficulty,
  });
}

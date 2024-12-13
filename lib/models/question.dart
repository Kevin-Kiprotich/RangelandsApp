enum QuestionType {text, singleChoice, multipleChoice, point, line, polygon}


class Question {
  Question({
    required this.id,
    required this.questionText,
    required this.type,
    this.options,
    this.answer,
  });

  
  final String id;
  final String questionText;
  final QuestionType type;
  final List<dynamic>? options;
  final dynamic answer;
}
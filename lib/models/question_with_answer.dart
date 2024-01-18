import 'package:quiz_app/models/answer.dart';

class QuestionWithAnswer {
  String Question = "";
  List<Answer> answers = [];
  int correctAnswer = -1;
  QuestionWithAnswer({
    required this.Question,
    required this.answers,
    required this.correctAnswer,
  });
}

List<QuestionWithAnswer> questionsWithAnswers = [
  QuestionWithAnswer(
    Question: "Whats your favorite color?",
    answers: [
      Answer(
        id: 1,
        data: 'red',
      ),
      Answer(
        id: 2,
        data: 'blue',
      ),
      Answer(
        id: 3,
        data: 'white',
      ),
    ],
    correctAnswer: 2,
  ),
  QuestionWithAnswer(
    Question: "Whats your favorite animal?",
    answers: [
      Answer(
        id: 1,
        data: 'Lion',
      ),
      Answer(
        id: 2,
        data: 'bird',
      ),
      Answer(
        id: 3,
        data: 'elephant',
      ),
    ],
    correctAnswer: 2,
  ),
  QuestionWithAnswer(
    Question: "Whats your favorite instructor?",
    answers: [
      Answer(
        id: 1,
        data: 'tarek',
      ),
      Answer(
        id: 2,
        data: 'tarekk',
      ),
      Answer(
        id: 3,
        data: 'tarekkk',
      ),
    ],
    correctAnswer: 1,
  ),
];

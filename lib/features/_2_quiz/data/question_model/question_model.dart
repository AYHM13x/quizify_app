import 'package:equatable/equatable.dart';

import 'answers.dart';
import 'correct_answers.dart';
import 'tag.dart';

class QuestionModel extends Equatable {
  final int? id; //
  final String? question; //
  final dynamic description;
  final Answers? answers; //
  final String? multipleCorrectAnswers;
  final CorrectAnswers? correctAnswers;
  final String? correctAnswer;
  final dynamic explanation;
  final dynamic tip;
  final List<Tag>? tags;
  final String? category;
  final String? difficulty;

  const QuestionModel({
    this.id,
    this.question,
    this.description,
    this.answers,
    this.multipleCorrectAnswers,
    this.correctAnswers,
    this.correctAnswer,
    this.explanation,
    this.tip,
    this.tags,
    this.category,
    this.difficulty,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'] as int?,
        question: json['question'] as String?,
        description: json['description'] as dynamic,
        answers: json['answers'] == null
            ? null
            : Answers.fromJson(json['answers'] as Map<String, dynamic>),
        multipleCorrectAnswers: json['multiple_correct_answers'] as String?,
        correctAnswers: json['correct_answers'] == null
            ? null
            : CorrectAnswers.fromJson(
                json['correct_answers'] as Map<String, dynamic>),
        correctAnswer: json['correct_answer'] as String?,
        explanation: json['explanation'] as dynamic,
        tip: json['tip'] as dynamic,
        tags: (json['tags'] as List<dynamic>?)
            ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
            .toList(),
        category: json['category'] as String?,
        difficulty: json['difficulty'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'description': description,
        'answers': answers?.toJson(),
        'multiple_correct_answers': multipleCorrectAnswers,
        'correct_answers': correctAnswers?.toJson(),
        'correct_answer': correctAnswer,
        'explanation': explanation,
        'tip': tip,
        'tags': tags?.map((e) => e.toJson()).toList(),
        'category': category,
        'difficulty': difficulty,
      };

  @override
  List<Object?> get props {
    return [
      id,
      question,
      description,
      answers,
      multipleCorrectAnswers,
      correctAnswers,
      correctAnswer,
      explanation,
      tip,
      tags,
      category,
      difficulty,
    ];
  }
}

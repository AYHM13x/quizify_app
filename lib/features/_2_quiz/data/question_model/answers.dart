import 'package:equatable/equatable.dart';

class Answers extends Equatable {
  final String? answerA;
  final String? answerB;
  final String? answerC;
  final String? answerD;
  final String? answerE;
  final String? answerF;

  const Answers({
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD,
    this.answerE,
    this.answerF,
  });

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
        answerA: json['answer_a'] as String?,
        answerB: json['answer_b'] as String?,
        answerC: json['answer_c'] as String?,
        answerD: json['answer_d'] as String?,
        answerE: json['answer_e'] as String?,
        answerF: json['answer_f'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'answer_a': answerA,
        'answer_b': answerB,
        'answer_c': answerC,
        'answer_d': answerD,
        'answer_e': answerE,
        'answer_f': answerF,
      };

  @override
  List<Object?> get props {
    return [
      answerA,
      answerB,
      answerC,
      answerD,
      answerE,
      answerF,
    ];
  }
}

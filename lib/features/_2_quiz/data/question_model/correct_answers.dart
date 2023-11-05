import 'package:equatable/equatable.dart';

class CorrectAnswers extends Equatable {
  final String? answerACorrect;
  final String? answerBCorrect;
  final String? answerCCorrect;
  final String? answerDCorrect;
  final String? answerECorrect;
  final String? answerFCorrect;

  const CorrectAnswers({
    this.answerACorrect,
    this.answerBCorrect,
    this.answerCCorrect,
    this.answerDCorrect,
    this.answerECorrect,
    this.answerFCorrect,
  });

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) {
    return CorrectAnswers(
      answerACorrect: json['answer_a_correct'] as String?,
      answerBCorrect: json['answer_b_correct'] as String?,
      answerCCorrect: json['answer_c_correct'] as String?,
      answerDCorrect: json['answer_d_correct'] as String?,
      answerECorrect: json['answer_e_correct'] as String?,
      answerFCorrect: json['answer_f_correct'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'answer_a_correct': answerACorrect,
        'answer_b_correct': answerBCorrect,
        'answer_c_correct': answerCCorrect,
        'answer_d_correct': answerDCorrect,
        'answer_e_correct': answerECorrect,
        'answer_f_correct': answerFCorrect,
      };

  @override
  List<Object?> get props {
    return [
      answerACorrect,
      answerBCorrect,
      answerCCorrect,
      answerDCorrect,
      answerECorrect,
      answerFCorrect,
    ];
  }
}

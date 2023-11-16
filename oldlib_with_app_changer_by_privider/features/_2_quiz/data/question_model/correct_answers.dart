import 'package:equatable/equatable.dart';

class CorrectAnswers extends Equatable {
  final List<String?> correctAnswerList;

  const CorrectAnswers({
    required this.correctAnswerList,
  });

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) {
    List<String?> list = [];
    list.add(json['answer_a_correct']);
    list.add(json['answer_b_correct']);
    list.add(json['answer_c_correct']);
    list.add(json['answer_d_correct']);
    list.add(json['answer_e_correct']);
    list.add(json['answer_f_correct']);
    return CorrectAnswers(correctAnswerList: list);
  }

// answerACorrect: json['answer_a_correct'] as String?,
//       answerBCorrect: json['answer_b_correct'] as String?,
//       answerCCorrect: json['answer_c_correct'] as String?,
//       answerDCorrect: json['answer_d_correct'] as String?,
//       answerECorrect: json['answer_e_correct'] as String?,
//       answerFCorrect: json['answer_f_correct'] as String?,

  Map<String, dynamic> toJson() => {
        'answer_a_correct': correctAnswerList[0],
        'answer_b_correct': correctAnswerList[1],
        'answer_c_correct': correctAnswerList[2],
        'answer_d_correct': correctAnswerList[3],
        'answer_e_correct': correctAnswerList[4],
        'answer_f_correct': correctAnswerList[5],
      };

  @override
  List<Object?> get props {
    return [
      correctAnswerList[0],
      correctAnswerList[1],
      correctAnswerList[2],
      correctAnswerList[3],
      correctAnswerList[4],
      correctAnswerList[5],
    ];
  }
}

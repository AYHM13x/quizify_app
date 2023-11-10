import 'package:equatable/equatable.dart';

class Answers extends Equatable {
  final List<String?> answerList;

  const Answers({required this.answerList});

  factory Answers.fromJson(Map<String, dynamic> json) {
    List<String?> list = [];
    list.add(json['answer_a']);
    list.add(json['answer_b']);
    list.add(json['answer_c']);
    list.add(json['answer_d']);
    list.add(json['answer_e']);
    list.add(json['answer_f']);
    return Answers(answerList: list);
  }

// answerA: json['answer_a'] as String?,
//         answerB: json['answer_b'] as String?,
//         answerC: json['answer_c'] as String?,
//         answerD: json['answer_d'] as String?,
//         answerE: json['answer_e'] as String?,
//         answerF: json['answer_f'] as String?,

  Map<String, dynamic> toJson() => {
        'answer_a': answerList[0],
        'answer_b': answerList[1],
        'answer_c': answerList[2],
        'answer_d': answerList[3],
        'answer_e': answerList[4],
        'answer_f': answerList[5],
      };

  @override
  List<Object?> get props {
    return [
      answerList[0],
      answerList[1],
      answerList[2],
      answerList[3],
      answerList[4],
      answerList[5],
    ];
  }
}

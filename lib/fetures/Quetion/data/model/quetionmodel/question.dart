import 'answer.dart';

class Question {
  String? id;
  String? text;
  String? type;
  int? questionNumber;
  int? grade;
  DateTime? createdAt;
  List<Answer>? answers;

  Question({
    this.id,
    this.text,
    this.type,
    this.questionNumber,
    this.grade,
    this.createdAt,
    this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'] as String?,
        text: json['text'] as String?,
        type: json['type'] as String?,
        questionNumber: json['questionNumber'] as int?,
        grade: json['grade'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        answers: (json['answers'] as List<dynamic>?)
            ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'type': type,
        'questionNumber': questionNumber,
        'grade': grade,
        'createdAt': createdAt?.toIso8601String(),
        'answers': answers?.map((e) => e.toJson()).toList(),
      };
}

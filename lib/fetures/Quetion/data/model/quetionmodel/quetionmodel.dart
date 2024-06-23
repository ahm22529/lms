import 'question.dart';

class Quetionmodel {
  String? id;
  String? title;
  dynamic notes;
  String? duration;
  String? startDate;
  String? endDate;
  int? grade;
  String? courseId;
  String? instructorId;
  DateTime? createdAt;
  dynamic status;
  List<Question>? questions;

  Quetionmodel({
    this.id,
    this.title,
    this.notes,
    this.duration,
    this.startDate,
    this.endDate,
    this.grade,
    this.courseId,
    this.instructorId,
    this.createdAt,
    this.status,
    this.questions,
  });

  factory Quetionmodel.fromJson(Map<String, dynamic> json) => Quetionmodel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        notes: json['notes'] as dynamic,
        duration: json['duration'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
        grade: json['grade'] as int?,
        courseId: json['courseId'] as String?,
        instructorId: json['instructorId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        status: json['status'] as dynamic,
        questions: (json['questions'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'notes': notes,
        'duration': duration,
        'startDate': startDate,
        'endDate': endDate,
        'grade': grade,
        'courseId': courseId,
        'instructorId': instructorId,
        'createdAt': createdAt?.toIso8601String(),
        'status': status,
        'questions': questions?.map((e) => e.toJson()).toList(),
      };
}

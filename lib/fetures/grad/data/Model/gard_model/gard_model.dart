class GardModel {
  String? title;
  int? grade;
  DateTime? date;

  GardModel({this.title, this.grade, this.date});

  factory GardModel.fromJson(Map<String, dynamic> json) => GardModel(
        title: json['title'] as String?,
        grade: json['grade'] as int?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'grade': grade,
        'date': date?.toIso8601String(),
      };
}

class QuizeModel {
  String? id;
  String? title;
  String? startDate;
  String? endDate;
  String? status;

  QuizeModel({
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.status,
  });

  factory QuizeModel.fromJson(Map<String, dynamic> json) => QuizeModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'startDate': startDate,
        'endDate': endDate,
        'status': status,
      };
}

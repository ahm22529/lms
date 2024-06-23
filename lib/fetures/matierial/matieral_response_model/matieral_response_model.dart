class MatieralResponseModel {
  String? lectureId;
  String? lectureName;
  String? semesterName;
  String? type;
  DateTime? createdAt;
  String? path;

  MatieralResponseModel({
    this.lectureId,
    this.lectureName,
    this.semesterName,
    this.type,
    this.createdAt,
    this.path,
  });

  factory MatieralResponseModel.fromJson(Map<String, dynamic> json) {
    return MatieralResponseModel(
      lectureId: json['lectureId'] as String?,
      lectureName: json['lectureName'] as String?,
      semesterName: json['semesterName'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'lectureId': lectureId,
        'lectureName': lectureName,
        'semesterName': semesterName,
        'type': type,
        'createdAt': createdAt?.toIso8601String(),
        'path': path,
      };
}

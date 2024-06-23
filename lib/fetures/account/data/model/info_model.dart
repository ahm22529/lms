class InfoModel {
  String? userId;
  String? fullName;
  String? email;
  String? phone;
  String? imagePath;
  String? academicId;
  int? level;
  String? departmentName;
  String? facultyName;
  String? universityName;

  InfoModel({
    this.userId,
    this.fullName,
    this.email,
    this.phone,
    this.imagePath,
    this.academicId,
    this.level,
    this.departmentName,
    this.facultyName,
    this.universityName,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        userId: json['userId'] as String?,
        fullName: json['fullName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        imagePath: json['imagePath'] as String?,
        academicId: json['academicId'] as String?,
        level: json['level'] as int?,
        departmentName: json['departmentName'] as String?,
        facultyName: json['facultyName'] as String?,
        universityName: json['universityName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'imagePath': imagePath,
        'academicId': academicId,
        'level': level,
        'departmentName': departmentName,
        'facultyName': facultyName,
        'universityName': universityName,
      };
}

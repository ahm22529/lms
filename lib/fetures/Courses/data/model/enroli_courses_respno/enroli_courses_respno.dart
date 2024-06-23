class EnroliCoursesRespno {
  String? cycleId;
  String? name;
  int? hours;
  String? imagePath;
  String? instructorFullName;

  EnroliCoursesRespno({
    this.cycleId,
    this.name,
    this.hours,
    this.imagePath,
    this.instructorFullName,
  });

  factory EnroliCoursesRespno.fromJson(Map<String, dynamic> json) {
    return EnroliCoursesRespno(
      cycleId: json['cycleId'] as String?,
      name: json['name'] as String?,
      hours: json['hours'] as int?,
      imagePath: json['imagePath'] as String?,
      instructorFullName: json['instructorFullName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'cycleId': cycleId,
        'name': name,
        'hours': hours,
        'imagePath': imagePath,
        'instructorFullName': instructorFullName,
      };
}

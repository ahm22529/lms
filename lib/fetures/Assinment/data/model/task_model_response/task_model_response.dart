class TaskModelResponse {
  String? taskId;
  String? taskName;
  DateTime? startDate;
  DateTime? endDate;
  String? status;

  TaskModelResponse({
    this.taskId,
    this.taskName,
    this.startDate,
    this.endDate,
    this.status,
  });

  factory TaskModelResponse.fromJson(Map<String, dynamic> json) {
    return TaskModelResponse(
      taskId: json['taskId'] as String?,
      taskName: json['taskName'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'taskId': taskId,
        'taskName': taskName,
        'startDate': startDate?.toIso8601String(),
        'endDate': endDate?.toIso8601String(),
        'status': status,
      };
}

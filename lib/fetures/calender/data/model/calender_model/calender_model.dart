class CalenderModel {
  String? calendarId;
  String? userId;
  String? startDate;
  String? endDate;
  String? body;

  CalenderModel({
    this.calendarId,
    this.userId,
    this.startDate,
    this.endDate,
    this.body,
  });

  factory CalenderModel.fromJson(Map<String, dynamic> json) => CalenderModel(
        calendarId: json['calendarId'] as String?,
        userId: json['userId'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'calendarId': calendarId,
        'userId': userId,
        'startDate': startDate,
        'endDate': endDate,
        'body': body,
      };
}

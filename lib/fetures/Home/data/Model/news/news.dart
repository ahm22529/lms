class News {
  String? newsId;
  String? content;
  String? filePath;
  String? facultyId;
  DateTime? createdAt;
  String? userId;
  String? userName;
  String? userImage;
  String? facultyName;

  News({
    this.newsId,
    this.content,
    this.filePath,
    this.facultyId,
    this.createdAt,
    this.userId,
    this.userName,
    this.userImage,
    this.facultyName,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        newsId: json['newsId'] as String?,
        content: json['content'] as String?,
        filePath: json['filePath'] as String?,
        facultyId: json['facultyId'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        userImage: json['userImage'] as String?,
        facultyName: json['facultyName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'newsId': newsId,
        'content': content,
        'filePath': filePath,
        'facultyId': facultyId,
        'createdAt': createdAt?.toIso8601String(),
        'userId': userId,
        'userName': userName,
        'userImage': userImage,
        'facultyName': facultyName,
      };
}

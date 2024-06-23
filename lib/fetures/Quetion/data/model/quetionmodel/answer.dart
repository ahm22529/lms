class Answer {
  String? id;
  String? text;
  DateTime? createdAt;

  Answer({this.id, this.text, this.createdAt});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] as String?,
      text: json['text'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );
  }

  toJson() {}
}

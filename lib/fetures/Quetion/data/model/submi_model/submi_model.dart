class SubmiModel {
  bool? q0011;

  SubmiModel({this.q0011});

  factory SubmiModel.fromJson(Map<String, dynamic> json) {
    return SubmiModel(
      q0011: json['Q001_1'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Q001_1': q0011,
    };
  }
}

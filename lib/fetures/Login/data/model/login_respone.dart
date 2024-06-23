class LoginRespone {
  String? displayName;
  String? email;
  String? token;
  String? userRole;

  LoginRespone({this.displayName, this.email, this.token, this.userRole});

  factory LoginRespone.fromJson(Map<String, dynamic> json) => LoginRespone(
        displayName: json['displayName'] as String?,
        email: json['email'] as String?,
        token: json['token'] as String?,
        userRole: json['userRole'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'email': email,
        'token': token,
        'userRole': userRole,
      };
}

// 登录请求
class UserLoginRequestEntity {
  String email;
  String password;

  UserLoginRequestEntity({
    required this.email,
    required this.password,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// // 登录返回
// class LoginModel {
//   String accessToken;
//   String displayName;
//   List<String> channels;

//   LoginModel({
//     required this.accessToken,
//     required this.displayName,
//     required this.channels,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         accessToken: json["access_token"],
//         displayName: json["display_name"],
//         channels: List<String>.from(json["channels"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "access_token": accessToken,
//         "display_name": displayName,
//         "channels": List<dynamic>.from(channels.map((x) => x)),
//       };
// }

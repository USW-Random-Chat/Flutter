class UserModel {
  final String account, password, email, nickname;

  UserModel.fromJson(Map<String, dynamic> json)
      : account = json["account"],
        password = json["password"],
        email = json["email"],
        nickname = json["nickname"];
}

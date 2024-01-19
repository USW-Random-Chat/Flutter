class UserModel {
  final String memberId, password, email, nickname;

  UserModel.fromJson(Map<String, dynamic> json)
      : memberId = json["memberId"],
        password = json["password"],
        email = json["email"],
        nickname = json["nickname"];
}

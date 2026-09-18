class UserInfo {
  final String id;
  final String account;
  final String mobile;
  final String token;
  final String avatar;
  final String nickname;
  final String gender;
  final String birthday;
  final String cityCode;
  final String provinceCode;
  final String profession;

  UserInfo({
    required this.id,
    required this.account,
    required this.mobile,
    required this.token,
    required this.avatar,
    required this.nickname,
    required this.gender,
    required this.birthday,
    required this.cityCode,
    required this.provinceCode,
    required this.profession,
  });

  factory UserInfo.fromJSON(Map<String, dynamic> data) {
    return UserInfo(
      id: data["id"] as String,
      account: data["account"] as String,
      mobile: data["mobile"] as String,
      token: data["token"] as String,
      avatar: data["avatar"] as String,
      nickname: data["nickname"] as String,
      gender: data["gender"] as String,
      birthday: data["birthday"] as String,
      cityCode: data["cityCode"] as String,
      provinceCode: data["provinceCode"] as String,
      profession: data["profession"] as String,
    );
  }
}

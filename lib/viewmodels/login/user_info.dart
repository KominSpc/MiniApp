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
      id: data["id"]?.toString() ?? '',
      account: data["account"]?.toString() ?? '',
      mobile: data["mobile"]?.toString() ?? '',
      token: data["token"]?.toString() ?? '',
      avatar: data["avatar"]?.toString() ?? '',
      nickname: data["nickname"]?.toString() ?? '',
      gender: data["gender"]?.toString() ?? '',
      birthday: data["birthday"]?.toString() ?? '',
      cityCode: data["cityCode"]?.toString() ?? '',
      provinceCode: data["provinceCode"]?.toString() ?? '',
      profession: data["profession"]?.toString() ?? '',
    );
  }
}

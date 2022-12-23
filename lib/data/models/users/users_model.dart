class UsersModel {
  int id;
  String username;
  String name;
  String state;
  String avatarUrl;

  UsersModel({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatarUrl,
  });

  factory UsersModel.fromJson(Map<String, dynamic> jsonData) => UsersModel(
        id: jsonData['id'] as int? ?? 0,
        username: jsonData['username'] as String? ?? '',
        name: jsonData['name'] as String? ?? '',
        state: jsonData['state'] as String? ?? '',
        avatarUrl: jsonData['avatar_url'] as String? ?? '',
      );
}

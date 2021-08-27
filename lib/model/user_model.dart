class UserModel {
  final String id;
  final String username;
  final String email;
  final String userRole;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.userRole,
    required this.photoUrl,
  });

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        userRole = data['userRole'],
        photoUrl = data['photoUrl'],
        username = data['username'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'userRole': userRole,
      'photoUrl': '',
      'username': email,
    };
  }

  Map<String, dynamic> data({required UserModel user}) {
    return {
      'id': user.id,
      'email': user.email,
      'userRole': user.userRole,
      'photoUrl': user.photoUrl,
      'username': user.username,
    };
  }
}

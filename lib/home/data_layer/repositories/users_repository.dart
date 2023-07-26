import 'dart:async';
import 'package:chat_app_demo/login/data_layer/models/models.dart';

class UsersRepository {
  final List<User> _users = [
    const User('Progyny1', 'progyny1@test.com', 'password'),
    const User('Progyny2', 'progyny1@test.com', 'password'),
    const User('Progyny3', 'progyny1@test.com', 'password'),
    const User('Progyny4', 'progyny1@test.com', 'password'),
    const User('Progyny5', 'progyny1@test.com', 'password'),
  ];

  Future<List<User>?> getUsers() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _users,
    );
  }

  void addUser(User user) {
    _users.add(user);
  }
}

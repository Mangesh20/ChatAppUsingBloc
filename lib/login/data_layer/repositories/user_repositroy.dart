import 'dart:async';
import 'package:chat_app_demo/login/data_layer/models/models.dart';

class UserRepository {
  User? _user;
  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = const User('Progyny', 'progyny@test.com'),
    );
  }
}
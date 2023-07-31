import 'dart:async';
import 'package:chat_app_demo/login/data_layer/models/models.dart';

class UserRepository {
  Future<User?> getUser(String username) async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => User(
        username.replaceAll('@test.com', ''),
        username,
      ),
    );
  }
}

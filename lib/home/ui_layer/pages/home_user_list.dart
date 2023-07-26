import 'package:chat_app_demo/chat_window/ui_layer/pages/chat_window.dart';
import 'package:chat_app_demo/login/data_layer/models/models.dart';
import 'package:flutter/material.dart';

class HomeUserList extends StatelessWidget {
  const HomeUserList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      const User('Progyny1', 'progyny1@test.com', 'password'),
      const User('Progyny2', 'progyny2@test.com', 'password'),
      const User('Progyny3', 'progyny3@test.com', 'password'),
      const User('Progyny4', 'progyny4@test.com', 'password'),
      const User('Progyny5', 'progyny5@test.com', 'password'),
    ];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].emailAddress),
            onTap: () {
              Navigator.push(
                context,
                ChatWindow.route(),
              );
            },
          ),
        );
      },
    );
  }
}

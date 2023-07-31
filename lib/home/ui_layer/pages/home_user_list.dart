import 'package:chat_app_demo/chat_window/ui_layer/pages/chat_window.dart';
import 'package:chat_app_demo/login/buisness_layer/authentication_bloc/authentication_bloc.dart';
import 'package:chat_app_demo/login/data_layer/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUserList extends StatelessWidget {
  const HomeUserList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      const User('Progyny1', 'progyny1@test.com'),
      const User('Progyny2', 'progyny2@test.com'),
      const User('Progyny3', 'progyny3@test.com'),
      const User('Progyny4', 'progyny4@test.com'),
      const User('Progyny5', 'progyny5@test.com'),
    ];

    List<User> getFilteredUsers(BuildContext context) {
      final user = context.read<AuthenticationBloc>().state.user;
      final newUsers = users.where((element) => element.emailAddress != user.emailAddress);
      return newUsers.toList();
    }

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: getFilteredUsers(context).length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(getFilteredUsers(context)[index].name),
                subtitle: Text(getFilteredUsers(context)[index].emailAddress),
                onTap: () {
                  Navigator.push(
                    context,
                    ChatWindow.route(getFilteredUsers(context)[index].emailAddress),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

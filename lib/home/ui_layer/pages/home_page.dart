import 'package:chat_app_demo/home/ui_layer/pages/home_user_list.dart';
import 'package:chat_app_demo/login/buisness_layer/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (context) {
          final userId = context.select(
            (AuthenticationBloc bloc) => bloc.state.user.name,
          );
          return Text(userId);
        }),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            
            onPressed: () => context.read<AuthenticationBloc>().add(
                  AuthenticationLogoutRequested(),
                ),
          ),
        ],
      ),
      body: const HomeUserList(),
    );
  }
}

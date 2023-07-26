import 'package:chat_app_demo/app_view.dart';
import 'package:chat_app_demo/login/buisness_layer/authentication_bloc/authentication_bloc.dart';
import 'package:chat_app_demo/login/data_layer/repositories/authentication_repository.dart';
import 'package:chat_app_demo/login/data_layer/repositories/user_repositroy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// App class is responsible for providing AuthenticationBloc and repositories to AppView widget

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    // disposing streams
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      ///wrapping the app view inside  AuthenticationBloc
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

import 'package:chat_app_demo/Signup/buisness_layer/bloc/signup_bloc.dart';
import 'package:chat_app_demo/Signup/data_layer/repositories/create_account_repository.dart';
import 'package:chat_app_demo/Signup/ui_layer/pages/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider<SignupBloc>(
          create: (_) {
            return SignupBloc(
              accountCreateRepository: AccountCreateRepository(),
            );
          },
          child: const SignupForm(),
        ),
      ),
    );
  }
}

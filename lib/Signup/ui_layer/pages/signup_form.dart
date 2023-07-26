import 'package:chat_app_demo/Signup/buisness_layer/bloc/signup_bloc.dart';
import 'package:chat_app_demo/login/data_layer/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    User? _user;

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Account Creation Failure')),
            );
        }
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Account created successfully!')),
            );

          Navigator.pop(context, _user);
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            __EmailAddressInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _SignupButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('SignupForm_usernameInput_textField'),
          onChanged: (username) => context.read<SignupBloc>().add(SignupUsernameChanged(username)),
          decoration: InputDecoration(
            labelText: 'Username',
            errorText: state.username.displayError != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class __EmailAddressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.emailAddress != current.emailAddress,
      builder: (context, state) {
        return TextField(
          key: const Key('SignupForm_emailAddressInput_textField'),
          onChanged: (emailAddress) => context.read<SignupBloc>().add(SignupEmailAddressChanged(emailAddress)),
          decoration: InputDecoration(
            labelText: 'email address',
            errorText: state.emailAddress.displayError != null ? 'invalid email address' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('SignupForm_passwordInput_textField'),
          onChanged: (password) => context.read<SignupBloc>().add(SignupPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            errorText: state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('SignupForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<SignupBloc>().add(const SignupSubmitted());
                      }
                    : null,
                child: const Text('Create Account'),
              );
      },
    );
  }
}

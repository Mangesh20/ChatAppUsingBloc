import 'package:chat_app_demo/Signup/ui_layer/pages/signup_page.dart';
import 'package:chat_app_demo/login/buisness_layer/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:chat_app_demo/login/data_layer/models/models.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _EmailAddressInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
            const SizedBox(
              height: 12,
            ),
            _SignupButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailAddressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.emailAddress != current.emailAddress,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailAddressInput_textField'),
          onChanged: (emailAddress) => context.read<LoginBloc>().add(LoginEmailAddressChanged(emailAddress)),
          decoration: InputDecoration(
            labelText: 'email address',
            errorText: state.emailAddress.displayError != null ? _getInvalidEmailErrorMessageFor(state.emailAddress.error) : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            errorText: state.password.displayError != null ? _getInvalidPasswordErrorMessageFor(state.password.error) : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                child: const Text('Login'),
              );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            SignUpPage.route(),
          );
        },
        child: const Text('Sign Up'));
  }
}

String _getInvalidPasswordErrorMessageFor(PasswordValidationError? error) {
  switch (error) {
    case PasswordValidationError.empty:
      return 'Password cannot be empty';

    case PasswordValidationError.tooLongLength:
      return 'Password too long';

    case PasswordValidationError.tooShortLength:
      return 'Password too short';

    default:
      return 'invalid password';
  }
}

String _getInvalidEmailErrorMessageFor(EmailValidationError? error) {
  switch (error) {
    case EmailValidationError.empty:
      return 'Email cannot be empty';

    case EmailValidationError.tooLongLength:
      return 'Email too long';

    case EmailValidationError.tooShortLength:
      return 'Email too short';

    case EmailValidationError.emailNotValid:
      return 'Email address not valid';

    default:
      return 'invalid email address';
  }
}

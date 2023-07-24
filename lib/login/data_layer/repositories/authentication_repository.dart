import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    /// Delaying result for 1 second to get the status
    await Future<void>.delayed(const Duration(seconds: 1));

    ///initial status would be uathenticated
    yield AuthenticationStatus.unauthenticated;

    ///susbsequent status would be added depending on events
    yield* _controller.stream;
  }

//passing username and password values for authentication purpose
  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      //Delaying the results for 1 second
      const Duration(seconds: 1),
      () {
        //making local validations for username and password
        if (password == "password" && username == "progyny@test.com") {
          return _controller.add(AuthenticationStatus.authenticated);
        } else {
          return _controller.add(AuthenticationStatus.unauthenticated);
        }
      },
    );
  }

  void logOut() {
    //changing the state on logout event to anauthenticated
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  //Closing strem controller _controller on dispose call
  void dispose() => _controller.close();
}

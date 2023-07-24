import 'dart:async';

enum AccountCreationStatus { unknown, created, notCreated }

class AccountCreateRepository {
  final _controller = StreamController<AccountCreationStatus>();

  Stream<AccountCreationStatus> get status async* {
    /// Delaying result for 1 second to get the status
    await Future<void>.delayed(const Duration(seconds: 1));

    ///initial status would be account not crated
    yield AccountCreationStatus.notCreated;

    ///susbsequent status would be added depending on events
    yield* _controller.stream;
  }

//passing username and password values for authentication purpose
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      //Delaying the results for 1 second
      const Duration(seconds: 1),
      () {
        //making local validations for username and password
        if (password == "password" && email == "progyny@test.com" && name == "progyny") {
          return _controller.add(AccountCreationStatus.created);
        } else {
          return _controller.add(AccountCreationStatus.notCreated);
        }
      },
    );
  }


  //Closing strem controller _controller on dispose call
  void dispose() => _controller.close();
}

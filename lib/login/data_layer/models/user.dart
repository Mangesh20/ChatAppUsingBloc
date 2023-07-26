import 'package:equatable/equatable.dart';

/// User is data model  

class User extends Equatable {
  const User(this.name, this.emailAddress, this.password);

  final String name;
  final String emailAddress;
  final String password;

  @override
  List<Object> get props => [name, password, emailAddress];

  static const empty = User('-', '-', '_');
}

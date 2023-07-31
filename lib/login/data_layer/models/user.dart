import 'package:equatable/equatable.dart';

/// User is data model

class User extends Equatable {
  const User(
    this.name,
    this.emailAddress,
  );

  final String name;
  final String emailAddress;

  @override
  List<Object> get props => [name, emailAddress];

  static const empty = User(
    '-',
    '-',
  );
}

import 'package:equatable/equatable.dart';

/// User is data model  

class User extends Equatable {
  const User(this.id, this.emailAddress);

  final String id;
  final String emailAddress;

  @override
  List<Object> get props => [id, emailAddress];

  static const empty = User('-', '-');
}

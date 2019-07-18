import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class AuthSilentEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {}

class AuthSignedInEvent extends AuthEvent {
  final String email;

  AuthSignedInEvent(this.email) : super([email]);
}

class AuthSignOutEvent extends AuthEvent {}

class AuthSignedOutEvent extends AuthEvent {}

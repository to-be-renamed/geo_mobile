import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class AuthEmptyState extends AuthState {}

class AuthSignedOutState extends AuthState {
  final String error;

  AuthSignedOutState([this.error]) : super([error]);
}

class AuthSignedInState extends AuthState {
  final String email;

  AuthSignedInState(this.email) : super([email]);
}

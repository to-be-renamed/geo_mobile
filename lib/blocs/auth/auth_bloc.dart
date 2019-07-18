import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GoogleSignIn _googleSignIn;

  StreamSubscription _signInSubscription;

  AuthBloc(this._googleSignIn) {
    _signInSubscription = _googleSignIn.onCurrentUserChanged.listen(_onSignIn);
  }

  @override
  void dispose() {
    _signInSubscription.cancel();

    super.dispose();
  }

  @override
  AuthState get initialState => AuthEmptyState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthSilentEvent) {
      yield* _mapSilentEventToState(event);
    } else if (event is AuthSignInEvent) {
      yield* _mapSignInEventToState(event);
    } else if (event is AuthSignedInEvent) {
      yield* _mapSignedInEventToState(event);
    } else if (event is AuthSignOutEvent) {
      yield* _mapSignOutEventToState(event);
    } else if (event is AuthSignedOutEvent) {
      yield* _mapSignedOutEventToState(event);
    }
  }

  Stream<AuthState> _mapSilentEventToState(AuthSilentEvent event) async* {
    await _googleSignIn.signInSilently();
    if (!await _googleSignIn.isSignedIn()) {
      yield AuthSignedOutState();
    }
  }

  Stream<AuthState> _mapSignInEventToState(AuthSignInEvent event) async* {
    if (currentState is AuthSignedOutState) {
      try {
        await _googleSignIn.signIn();
      } catch (exception) {
        yield AuthSignedOutState("Failed to sign in");
      }
    }
  }

  Stream<AuthState> _mapSignedInEventToState(AuthSignedInEvent event) async* {
    yield AuthSignedInState(event.email);
  }

  Stream<AuthState> _mapSignOutEventToState(AuthSignOutEvent event) async* {
    _googleSignIn.disconnect();
  }

  Stream<AuthState> _mapSignedOutEventToState(AuthSignedOutEvent event) async* {
    yield AuthSignedOutState();
  }

  void _onSignIn(GoogleSignInAccount account) {
    if (account == null) {
      dispatch(AuthSignedOutEvent());
    } else {
      dispatch(AuthSignedInEvent(account.email));
    }
  }
}

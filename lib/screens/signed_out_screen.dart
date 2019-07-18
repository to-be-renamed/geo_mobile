import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_mobile/blocs/blocs.dart';

class SignedOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthSignedInState) {
          Navigator.pushReplacementNamed(context, "/home");
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Sign in")),
        body: Center(
          child: RaisedButton(
            child: Text("Sign in"),
            onPressed: () => authBloc.dispatch(AuthSignInEvent()),
          ),
        ),
      ),
    );
  }
}

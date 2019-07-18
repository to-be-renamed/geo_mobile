import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_mobile/blocs/blocs.dart';

class InitialScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitialScreenState();
  }
}

class InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();

    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.dispatch(AuthSilentEvent());
  }

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener(
      bloc: authBloc,
      listener: (context, state) {
        if (state is AuthSignedOutState) {
          Navigator.pushReplacementNamed(context, "/signed-out");
        } else if (state is AuthSignedInState) {
          Navigator.pushReplacementNamed(context, "/home");
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

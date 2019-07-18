import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_mobile/blocs/blocs.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.account_circle),
        Text("Profile"),
        RaisedButton(
          child: Text("Sign out"),
          onPressed: () => authBloc.dispatch(AuthSignOutEvent()),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_mobile/blocs/blocs.dart';
import 'package:geo_mobile/screens/screens.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  final googleSignIn = GoogleSignIn(scopes: ['email']);

  runApp(BlocProvider(
    builder: (context) => AuthBloc(googleSignIn),
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToBeRenamed",
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => InitialScreen(),
        "/signed-out": (context) => SignedOutScreen(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}

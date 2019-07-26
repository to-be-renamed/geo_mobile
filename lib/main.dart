import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_mobile/blocs/blocs.dart';
import 'package:geo_mobile/screens/screens.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  await GlobalConfiguration().loadFromAsset("app_settings");

  final googleSignIn = GoogleSignIn(scopes: ['email']);

  runApp(BlocProvider(
    builder: (context) => AuthBloc(googleSignIn),
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = GlobalConfiguration().get("appName");

    return MaterialApp(
      title: title.toString(),
      theme: ThemeData.dark(),
      routes: {
        "/": (context) => InitialScreen(),
        "/signed-out": (context) => SignedOutScreen(),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}

import 'package:carmel_bakeryy/app/cubit/root_cubit.dart';
import 'package:carmel_bakeryy/features/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is not signed in
        if (!snapshot.hasData) {
          return SignInScreen(
            headerBuilder: (context, constraints, _) {
              return const Image(
                image: AssetImage('assets/images/carmelbak_log.jpeg'),
                height: 176,
                width: 193,
              );
            },
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
          );
        }

        // Render your application if authenticated
        return HomePage();
      },
    );
  }
}

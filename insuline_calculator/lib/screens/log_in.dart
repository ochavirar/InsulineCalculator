import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/main_screen.dart';
import 'package:insuline_calculator/widgets/log_in_widgets/header.dart';
import 'package:insuline_calculator/widgets/log_in_widgets/log_in_terms.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return SignInScreen(
          providers: [
            EmailAuthProvider(),
            GoogleProvider(clientId: "385303832432-7bbdfp535fopcgj7nn08vu1sq4b7s2bu.apps.googleusercontent.com"),
          ],
          headerBuilder: (context, constraints, shrinkOffset) {
            return HeaderLogIn();
          },

          subtitleBuilder: (context, action) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: action == AuthAction.signIn
                  ? const Text('¡Bienvenido a la Calculadora de Insulina! Ingresa tu correo y contraseña para iniciar sesión')
                  : const Text('¡Bienvenido a la Calculadora de Insulina! Registra tu cuenta en la app'),
            );
          },
          footerBuilder: (context, action) {
            return LogInTerms();
          },
          sideBuilder: (context, shrinkOffset) {
            return Padding(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: 1,
              child: //Image.asset('assets/flutterfire_300x.png'),
              Image.asset( 'assets/images/corazon.png'
                ),
              ),
            );
          },
        );
       }

       return const MainScreen();
     },
   );
  }
}
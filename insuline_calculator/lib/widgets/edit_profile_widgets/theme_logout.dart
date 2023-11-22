import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/screens/log_in.dart';
import 'package:insuline_calculator/providers/theme/theme_provider.dart';

class BottomEditProfilePage extends StatefulWidget {
  const BottomEditProfilePage({super.key});

  @override
  State<BottomEditProfilePage> createState() => _BottomEditProfilePageState();
}

class _BottomEditProfilePageState extends State<BottomEditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              //invocar funcion de provider que cambia tema de la aplicacion
              context.read<ThemeProvider>().changeTheme();
            },
            child: const Text('Change Theme')),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.08),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await GoogleSignIn().signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LogIn()),
                );
              },
              child: Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onError,
                ),
              )),
        )
      ],
    );
  }
}

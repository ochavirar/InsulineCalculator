import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insuline_calculator/screens/log_in.dart';

class NameChangeForm extends StatelessWidget {
  const NameChangeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.width * 0.05),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: FormText(text: 'Nombres'),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Ingresa tu nombre',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Cambiar',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordChangeForm extends StatelessWidget {
  const PasswordChangeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.width * 0.05),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: FormText(text: 'Contraseña'),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Ingresa tu nueva contraseña',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.005,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Confirma tu nueva contraseña',
              ),
            ),
          ),
          MaterialButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Cambiar',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              )),
        ],
      ),
    );
  }
}

class FormText extends StatelessWidget {
  const FormText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

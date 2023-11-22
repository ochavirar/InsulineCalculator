import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insuline_calculator/screens/log_in.dart';

class NameChangeForm extends StatelessWidget {
  const NameChangeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.21,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).secondaryHeaderColor,
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: FormText(text: 'Nombre'),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingresa tu nombre',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text('Cambiar'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PasswordChangeForm extends StatelessWidget {
  const PasswordChangeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).secondaryHeaderColor,
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
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
                  color: Theme.of(context).primaryColor,
                  onPressed: () {}, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text('Cambiar')
                ),
                const SwitchDarkMode(),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.8, 
                        MediaQuery.of(context).size.height * 0.08
                      ),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogIn()),
                      );
                    }, 
                    child: const Text('Cerrar sesión')
                  ),
                ) 
              ],
            ),
          ),
        ] 
    );
  }
}

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({super.key});

  @override
  State<SwitchDarkMode> createState() => _SwitchDarkModeState();
}

class _SwitchDarkModeState extends State<SwitchDarkMode> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text('Modo oscuro'),
        Switch(
          value: darkMode,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
          },
        ),
      ],
    );
  }
}

class FormText extends StatelessWidget {
  const FormText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, 
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    );
  }
}


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/main_screen.dart';
import 'package:insuline_calculator/screens/sign_up.dart';
import 'package:insuline_calculator/widgets/log_in_widgets/policy_dialog.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                  child: const Text("Correo electrónico",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingresa tu correo electrónico',
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01,
                  top: MediaQuery.of(context).size.height * 0.02),
                  child: const Text("Contraseña",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Ingresa tu contraseña',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                  },
                  child: const Text('Ingresar'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  child: const Text('¿No tienes cuenta? Regístrate',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Al utilizar la aplicación, aceptas nuestros\n",
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: "Terminos y Condiciones ", 
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          //Abrir dialogo de terminos y condiciones
                          showDialog(context: context, builder: (context){
                            return PolicyDialog(mdFileName:  'terminos_condiciones.md');
                          });
                        }
                      ),
                      TextSpan(text: "y "),
                      TextSpan(
                        text: "Aviso de Privacidad",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          //Abrir dialogo de aviso de privacidad
                          showDialog(context: context, builder: (context){
                            return PolicyDialog(mdFileName:  'aviso_privacidad.md');
                          });
                        }
                      )
                    ]
                  
                  )
                ),
              ),
            ]
          )
        )
      ]
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/log_in_widgets/policy_dialog.dart';

class LogInTerms extends StatelessWidget {
  const LogInTerms({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                fontSize: 15,
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold
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
                fontSize: 15,
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold
              ),
              recognizer: TapGestureRecognizer()..onTap = (){
                //Abrir dialogo de aviso de privacidadS
                showDialog(context: context, builder: (context){
                  return PolicyDialog(mdFileName:  'aviso_privacidad.md');
                });
              }
            )
          ]
        )
      ),
    );
  }
}
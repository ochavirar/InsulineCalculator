import 'package:flutter/material.dart';
import '../screens/log_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: 
        Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.05,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
            child:  ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.width * 0.1
                  ),
                  child: const Text("Registro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Nombre",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Ingresa tu nombre',
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10,
                    top: 20),
                    child: Text("Correo electrónico",
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
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10,
                    top: 20),
                    child: Text("Contraseña",
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
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10,
                    top: 20),
                    child: Text("Confirmar contraseña",
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
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                        SnackBar snackBar = const SnackBar(content: Text('Registro exitoso'));
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //Delay 2 seconds
                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn()));
                        });
                    },
                    child: const Text('Continuar'),
                  ),
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}
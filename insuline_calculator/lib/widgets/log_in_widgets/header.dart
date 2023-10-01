import 'package:flutter/material.dart';

class HeaderLogIn extends StatelessWidget {
  const HeaderLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'https://cdn-icons-png.flaticon.com/512/3799/3799666.png',
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02),
            child: const Align(
              alignment: Alignment.center,
              child: Text("Calculadora de insulina",
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                  child: const Text("Log In",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            const Align(
                alignment: Alignment.topLeft,
                child: Text("Ingresa con tu correo y contraseña",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),          
      ],
    );
  }
}
import 'package:flutter/material.dart';

class HeaderLogIn extends StatelessWidget {
  const HeaderLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset( 'assets/images/corazon.png',
        ),
      )
    );
  }
}
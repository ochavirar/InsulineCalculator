import 'package:flutter/material.dart';
import 'header.dart';
import 'log_in_form.dart';

class LogInContainer extends StatelessWidget {
  const LogInContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Container(
          margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: ListView(
            children: const [
              HeaderLogIn(),
              LogInForm()
            ],
          )
        ),
      )
    );
  }
}
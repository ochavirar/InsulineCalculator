import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/register_food.dart';

void main() {
  runApp(
      MaterialApp(
      home: RegisterFood(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    )
    );
}

import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';
import 'package:insuline_calculator/screens/bolus_history.dart';
import 'package:insuline_calculator/screens/register_food.dart';
import 'package:insuline_calculator/screens/reports.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers:[
          
          ChangeNotifierProvider(create: (_) => ReportsProvider())
          ] ,
        child: MaterialApp(
          home: RegisterFood(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
        ),
      )
    );
}

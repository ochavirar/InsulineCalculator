import 'package:flutter/material.dart';
import 'screens/main_bolus.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';
import 'package:insuline_calculator/screens/bolus_history.dart';
import 'package:insuline_calculator/screens/register_food.dart';
import 'package:insuline_calculator/screens/reports.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BolusProvider()),
      ChangeNotifierProvider(create: (_) => ReportsProvider())
      //provider garay
    ],
    child: MaterialApp(
      home: MainBolusScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    ),
  ));

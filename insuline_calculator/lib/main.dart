import 'package:flutter/material.dart';
import 'screens/main_bolus.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BolusProvider()),
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
}

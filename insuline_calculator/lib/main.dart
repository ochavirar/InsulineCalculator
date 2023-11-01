import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/sliders_provider.dart';
import 'package:insuline_calculator/screens/main_screen.dart';
// import 'screens/log_in.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/theme/theme_provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => BolusProvider()),
    ChangeNotifierProvider(create: (_) => ReportsProvider()),
    ChangeNotifierProvider(create: (_) => SliderProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Insulin Calculator',
        theme: context.watch<ThemeProvider>().themeData,
        home: const MainScreen());
  }
}

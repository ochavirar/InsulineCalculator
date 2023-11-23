import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/firebase_options.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'screens/log_in.dart';

import 'package:insuline_calculator/providers/sliders_provider.dart';

import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/theme/theme_provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(AZFoodListItemAdapter());
  
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => BolusProvider()),
    ChangeNotifierProvider(create: (_) => ReportsProvider()),
    ChangeNotifierProvider(create: (_) => SliderProvider()),
    ChangeNotifierProvider(create: (_) => StorageProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Insulin Calculator',
        theme: context.watch<ThemeProvider>().themeData,
        home: const LogIn());
  }
}

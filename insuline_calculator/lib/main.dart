import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'screens/main_bolus.dart';
import 'screens/log_in.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';
import 'package:insuline_calculator/screens/bolus_history.dart';
import 'package:insuline_calculator/screens/register_food.dart';
import 'package:insuline_calculator/screens/reports.dart';

void main() async{
    await Hive.initFlutter();
    Hive.registerAdapter(AZFoodListItemAdapter());

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BolusProvider()),
      ChangeNotifierProvider(create: (_) => ReportsProvider()),
      ChangeNotifierProvider(create: (_) => StorageProvider()),
      //provider garay
    ],
    child: MaterialApp(
      home: const LogIn(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    ),
  ));
}

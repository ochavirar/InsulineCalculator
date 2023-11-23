import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/bolus_history.dart';
import 'package:insuline_calculator/screens/main_food_list.dart';
import 'package:insuline_calculator/screens/main_screen.dart';
import 'package:insuline_calculator/screens/reports.dart';
import 'package:insuline_calculator/screens/sensibility_settings.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:insuline_calculator/screens/main_bolus.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      theme: SidebarXTheme(
          width: MediaQuery.of(context).size.width * 0.4,
          textStyle:
              TextStyle(color: Theme.of(context).colorScheme.onBackground),
          selectedTextStyle:
              TextStyle(color: Theme.of(context).colorScheme.onBackground),
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onBackground)),
      controller: SidebarXController(selectedIndex: 0, extended: true),
      items: [
        SidebarXItem(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainScreen()));
          },
          icon: Icons.home,
          label: ' Inicio',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainBolusScreen()));
          },
          icon: Icons.calculate,
          label: 'Calcular Bolus',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BolusHistory()));
          },
          icon: Icons.timelapse,
          label: 'Historial',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SensibilitySettings()));
          },
          icon: Icons.settings_accessibility,
          label: 'Sensibilidad',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainFoodList()));
          },
          icon: Icons.food_bank,
          label: 'Alimentos',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Reports()));
          },
          icon: Icons.auto_graph,
          label: 'Reportes',
        ),
      ],
    );
  }
}

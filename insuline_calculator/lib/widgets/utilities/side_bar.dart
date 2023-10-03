import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/edit_profile.dart';
import 'package:insuline_calculator/screens/main_screen.dart';
import 'package:insuline_calculator/screens/sensibility_settings.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      theme: SidebarXTheme(
        width: MediaQuery.of(context).size.width * 0.3
      ),
      controller: SidebarXController(selectedIndex: 0, extended: true),
      items: [
        SidebarXItem(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
          },
          icon: Icons.home, label: 'Inicio',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
          },
          icon: Icons.calculate, label: 'Calcular Bolus',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
          },
          icon: Icons.timelapse, label: 'Historial',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SensibilitySettings()));
          },
          icon: Icons.settings_accessibility, label: 'Factor de sensibilidad',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
          },
          icon: Icons.food_bank, label: 'List de alimentos',
        ),
        SidebarXItem(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
          },
          icon: Icons.auto_graph, label: 'Reportes',
        ),

      ],
    );
  }
}
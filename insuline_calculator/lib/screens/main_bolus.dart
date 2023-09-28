import 'package:flutter/material.dart';
import 'bolus_data.dart';
import 'bolus_food.dart';

class MainBolusScreen extends StatefulWidget {
  const MainBolusScreen({super.key});

  @override
  State<MainBolusScreen> createState() => _MainBolusScreenState();
}

class _MainBolusScreenState extends State<MainBolusScreen> {
  int _selectedPage = 1;
  final List<Widget> _pages = [const BolusFood(), const BolusData()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bolus de Insulina',
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: _pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Food'),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Review'),
          ],
        ));
  }
}

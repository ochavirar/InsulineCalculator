import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/utilities/side_bar.dart';
import 'bolus_data.dart';
import 'bolus_food.dart';

class MainBolusScreen extends StatefulWidget {
  const MainBolusScreen({super.key});

  @override
  State<MainBolusScreen> createState() => _MainBolusScreenState();
}

class _MainBolusScreenState extends State<MainBolusScreen> {
  int _selectedPage = 0;

  final List<Widget> _pages = [BolusFood(), BolusData()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
        appBar: AppBar(
          title: Text(
            'Bolus de Insulina',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
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

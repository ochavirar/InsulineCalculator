import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/history_widgets/bolus_calendar.dart';
import 'package:insuline_calculator/widgets/utilities/side_bar.dart';

class BolusHistory extends StatefulWidget {
  const BolusHistory({super.key});

  @override
  State<BolusHistory> createState() => _BolusHistoryState();
}

class _BolusHistoryState extends State<BolusHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const SideBar(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
              child: Text("Historial Bolus",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary))),
        ),
        body: Container(child: BolusCalendar()));
  }
}

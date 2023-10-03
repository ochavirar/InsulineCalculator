import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/history_widgets/bolus_calendar.dart';


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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text("Historial Bolus", style:TextStyle(color: Colors.white))),
      ),

      body: Container(child: BolusCalendar()
      )
    );
  }
}
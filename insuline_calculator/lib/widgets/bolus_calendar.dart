
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:insuline_calculator/widgets/bolus_history_item.dart';




class BolusCalendar extends StatefulWidget {
  const BolusCalendar({super.key});
  @override
  _BolusCalendarState createState() => _BolusCalendarState();
}

class _BolusCalendarState extends State<BolusCalendar> {

  late final ValueNotifier<List<BolusHistoryItem>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  //Valores hardcodeados para mostrar los eventos del calendario
  Map<DateTime, List<BolusHistoryItem>>  events = {
    DateTime.utc(2023,9,28) : [BolusHistoryItem(time: DateTime.utc(2023,9,28,8,5), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 100),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,18,23), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 100),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],
      
    DateTime.utc(2023,9,26) : [BolusHistoryItem(time: DateTime.utc(2023,9,28,16,10), unitsFood: 2.5, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.5, glucoseLevel: 100),
      BolusHistoryItem(time: DateTime.utc(2023,9,28,21,10), unitsFood: 2, 
      listFood: ["Zucaritas 30g", "Zucaritas 30g"], unitsGlucose: 1.0, glucoseLevel: 100),
      ],
  };

  //Función para recuperar los eventos del mapa según una llave (día) otorgada.
  List<BolusHistoryItem> _getEventsForDay(DateTime day) {

    return events[day] ?? [];
  }

  @override 
  void initState(){
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    print("Entre");
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      // Call `setState()` when updating the selected day
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2015, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.
    
              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
    
    
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          
          Divider(thickness: 5, height: 30, color: Theme.of(context).primaryColor),
    
          Expanded(
            child: ValueListenableBuilder<List<BolusHistoryItem>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return value[index];
                  },
                );
              }
            )
          )
        ],
      ),
    );
  }
}
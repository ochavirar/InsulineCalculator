import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'package:insuline_calculator/widgets/history_widgets/bolus_history_item.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

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
  Map<String, List<BolusHistoryItem>> cleanMap = {};

  //Valores hardcodeados para mostrar los eventos del calendario

  //Función para recuperar los eventos del mapa según una llave (día) otorgada.
  List<BolusHistoryItem> _getEventsForDay(DateTime day) {
    cleanMap = Provider.of<BolusProvider>(context, listen:false).historyMap;
    return cleanMap[day.toString().split(' ')[0]] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier( _getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(selectedDay, focusedDay)  {
    if (!isSameDay(_selectedDay, selectedDay)) {
      // Call `setState()` when updating the selected day
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value =  _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context)  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
      child: Column(
        children: [
          TableCalendar(
            calendarStyle: const CalendarStyle(
              markersAlignment: Alignment.bottomRight,
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) => events.isNotEmpty
                  ? Container(
                      width: 18,
                      height: 18,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text(
                        '${events.length}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    )
                  : null,
            ),
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
          Divider(
              thickness: 4, height: 15, color: Theme.of(context).primaryColor),
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
                  })),
          // Padding(
          //   padding: const EdgeInsets.only(top: 6.0),
          //   child: SizedBox(
          //       width: 120,
          //       height: 40,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             textStyle:
          //                 const TextStyle(fontSize: 14, color: Colors.white),
          //             backgroundColor: Theme.of(context).primaryColor,
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10))),
          //         onPressed: () {},
          //         child: const Text('Regresar',
          //             style: TextStyle(fontSize: 14, color: Colors.white)),
          //       )),
          // ),
        ],
      ),
    );
  }
}

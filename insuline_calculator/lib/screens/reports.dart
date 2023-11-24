// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/full_bolus.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'package:insuline_calculator/widgets/report_widgets/barchart_reports.dart';
import 'package:insuline_calculator/widgets/report_widgets/month_picker_dialog.dart';
import 'package:insuline_calculator/widgets/report_widgets/report_table.dart';
import 'package:insuline_calculator/widgets/report_widgets/week_picker_dialog.dart';
import 'package:insuline_calculator/widgets/utilities/side_bar.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/provider_reports.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  Map<String, List<FullBolus>> cleanMap = {};

  //Inicializamos a que la pantalla tenga la gráfica y datos de la semana actual 
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   Provider.of<ReportsProvider>(context).calculateAvg(MapEvents().events);
  // }

  void showWeekPicker(BuildContext context, Map<String, List<FullBolus>> cleanMap) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WeekPicker(cleanMap: cleanMap);
        });
  }

  void showMonthPicker(BuildContext context, Map<String, List<FullBolus>> cleanMap) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MonthPicker(cleanMap: cleanMap,);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const SideBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Reportes",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15.0, 10, 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text("Semanal:",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      textStyle: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  onPressed: () async{
                                    cleanMap = await Provider.of<BolusProvider>(context, listen:false).createCleanMap();
                                    showWeekPicker(context, cleanMap);
                                  },
                                  child: const Text('Elegir semana',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                )),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text("Mensual:",
                                style: TextStyle(fontSize: 16)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      textStyle: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  onPressed: () async {
                                    cleanMap = await Provider.of<BolusProvider>(context, listen:false).createCleanMap();
                                    showMonthPicker(context, cleanMap);
                                  },
                                  child: const Text('Elegir mes',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                )),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),

              //Widget que crea las gráficas de barras
              BarChartReportes(),

              Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Gráfica promedio de glucosa (mg/dl) por día",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
              ),

              Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Periodo: ${dateFormat.format(Provider.of<ReportsProvider>(context).startDate)} - ${dateFormat.format(Provider.of<ReportsProvider>(context).endDate)}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ]),
              ),

              //Widget que de la tabla con las mediciones
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ReportTable(),
              ),

              // SizedBox(
              //     width: 140,
              //     height: 40,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           textStyle:
              //               const TextStyle(fontSize: 20, color: Colors.white),
              //           backgroundColor: Theme.of(context).primaryColor,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(5))),
              //       onPressed: () {},
              //       child: const Text('Regresar',
              //           style: TextStyle(fontSize: 15, color: Colors.white)),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}

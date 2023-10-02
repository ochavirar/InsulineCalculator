import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/barchart_reports.dart';
import 'package:insuline_calculator/widgets/month_picker_dialog.dart';
import 'package:insuline_calculator/widgets/report_table.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/provider_reports.dart';
import 'package:insuline_calculator/widgets/week_picker_dialog.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  void showWeekPicker(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WeekPicker();
    }
  );
  }

  void showMonthPicker(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return MonthPicker();
    }
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text("Reportes", style:TextStyle(color: Colors.white))),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,15.0,10,15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [              
            Padding(
              padding: const EdgeInsets.only(left:10, right:10),
              child: Row(children: [
                Expanded(child: 
                    Container(
                      child: Column(
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text("Semanal:",style:TextStyle(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15, color:Colors.white),
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                )
                              ), onPressed: () {
                                showWeekPicker(context);
                              }, 
                              child: const Text('Elegir semana',style: TextStyle(fontSize: 15, color:Colors.white)),
                            )
                          ),
                        ),
                    
                      ]),
                    ),
                  ),
                  Expanded(child: 
                    Container(
                      child: Column(
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text("Mensual:",style:TextStyle(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15, color:Colors.white),
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                )
                              ), onPressed: () {
                                showMonthPicker(context);
                              }, 
                              child: const Text('Elegir mes',style: TextStyle(fontSize: 15, color:Colors.white)),
                            )
                          ),
                        ),
                      ]),
                    ),
                  ),
              ],),
            ),
      
            //Widget que crea las gráficas de barras
            BarChartReportes(),

            Container(
              child: Column(
                children: [
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: Text("Gráfica promedio de glucosa (md/dl) por día",
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                ),

              ]),
            ),

            Container(
              child: Column(
                children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text("Periodo: ${dateFormat.format(Provider.of<ReportsProvider>(context).startDate)} - ${dateFormat.format(Provider.of<ReportsProvider>(context).endDate)}",
                  style: TextStyle(fontSize: 15),),
                ),

              ]),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top:8.0),
            //   child: Text("Glucosa Promedio: 100 mg/dl"),
            // ),

            //Widget que de la tabla con las mediciones 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReportTable(),
            ),
      
            SizedBox(
              width: 140,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20, color:Colors.white),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ), onPressed: () {  }, 
                child: const Text('Regresar',style: TextStyle(fontSize: 15, color:Colors.white)),
              )
            ),
          ],),
        ),
      ),
    );
  }
}
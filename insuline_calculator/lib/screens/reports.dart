import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/provider_reports.dart';
import 'package:insuline_calculator/widgets/week_picker.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  void showWeekPicker(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WeekPicker();
    }
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Colors.blue,
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
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Semanal:"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15, color:Colors.white),
                                backgroundColor: Colors.blue,
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
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Mensual:"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 15, color:Colors.white),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                )
                              ), onPressed: () {  }, 
                              child: const Text('Elegir mes',style: TextStyle(fontSize: 15, color:Colors.white)),
                            )
                          ),
                        ),
                      ]),
                    ),
                  ),
              ],),
            ),
      
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 10),
              child: Container(
                width: 340,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                  image: DecorationImage(
                    image: NetworkImage('https://www.pequerecetas.com/wp-content/uploads/2020/10/tacos-mexicanos.jpg'), 
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
            ),

            Container(
              child: Column(
                children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text("Periodo:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text("${dateFormat.format(Provider.of<ReportsProvider>(context).startDate)} - ${dateFormat.format(Provider.of<ReportsProvider>(context).endDate)}")
                ),
            
              ]),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FractionColumnWidth(0.65),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        child: Center(child: Text("Atributo",style: TextStyle(color:Colors.white),)),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Center(child: Text("Promedio",style: TextStyle(color:Colors.white),)),
                      ),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text("Unidades de insulina")),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text("3.5 U")),
                      ),
                    ],
                  ),
            
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text("Carbohidratos")),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text("100 g")),
                      ),
                    ],
                  ),

                  TableRow(
                    children: <Widget>[
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text("Hemoglobina glucosilada")),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(child: Text("Por implementar")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      
            SizedBox(
              width: 140,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20, color:Colors.white),
                  backgroundColor: Colors.blue,
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
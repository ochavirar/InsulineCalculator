import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';
import 'package:provider/provider.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Theme.of(context).primaryColor,
        width: 2,
        borderRadius: BorderRadius.circular(15),
        style: BorderStyle.solid
      ),
      columnWidths: const <int, TableColumnWidth>{
        0: FractionColumnWidth(0.65),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                color: Theme.of(context).primaryColor,),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("Atributo",style: TextStyle(color:Colors.white, fontSize: 15),)),
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                color: Theme.of(context).primaryColor,),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("Promedio",style: TextStyle(color:Colors.white, fontSize: 15),)),
              ),
            ),
          ],
        ),

        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("Glucosa")),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("${Provider.of<ReportsProvider>(context, listen: false).totalGlucoseAvg.toStringAsFixed(2) } mg/dl")),
              )
            ),
          ],
        ),

        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("Unidades de insulina")),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("${Provider.of<ReportsProvider>(context, listen: false).totalUnitsAvg.toStringAsFixed(2)} U")),
              )
            ),
          ],
        ),
  
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("Carbohidratos")),
              )
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("${Provider.of<ReportsProvider>(context, listen: false).totalCarbsAvg.toStringAsFixed(2) } g")),
              )
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/full_bolus.dart';
import 'package:insuline_calculator/widgets/report_widgets/dropdown_menu_years.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/provider_reports.dart';



class MonthPicker extends StatefulWidget {
  final Map<String, List<FullBolus>> cleanMap;
  const MonthPicker({super.key, required Map<String, List<FullBolus>> this.cleanMap});
  @override
  _MonthPickerState createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  final TextEditingController controllerDropdown = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return SimpleDialog(
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.fromLTRB(24,20,24,10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    title: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Theme.of(context).primaryColor,),
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      child: Text('Selección mes', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),)),

    children:[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(children: [
          Expanded(child: Center(child: Text("Año: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),),
          Expanded(child: Center(child: DropdownMenuYears(controllerYear: controllerDropdown,)))
        ],),
        
        Divider(thickness: 3, height: 30, color: Theme.of(context).primaryColor),

        Row(children: [
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Enero")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),1,1);
                    //Obtenemos el ultimo día restándole 1 al inicial del siguiente mes
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),2,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  } 
                ),
              ),
            )
          ),
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Febrero")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),2,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),3,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();            
                  }
                ),
              ),
            ),
          ),
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                  child:SimpleDialogOption(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Marzo")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),3,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),4,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              )
            )
          ),
        ],),

        Row(children: [
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Abril")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),4,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),5,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),

          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(              
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Mayo")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),5,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),6,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(              
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Junio")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),6,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),7,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
        ],),

        Row(children: [
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(              
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Julio")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),7,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),8,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(              
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Agosto")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),8,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),9,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(              
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Septiembre")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),9,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),10,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
        ],),

        Row(children: [
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Octubre")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),10,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),11,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Noviembre")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),11,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text),12,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
          Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
                child: SimpleDialogOption(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Center(child: Text("Diciembre")),
                  onPressed: () {
                    Provider.of<ReportsProvider>(context, listen: false).startDate = DateTime.utc(int.parse(controllerDropdown.text),12,1);
                    Provider.of<ReportsProvider>(context, listen: false).endDate = DateTime.utc(int.parse(controllerDropdown.text)+1,1,1).subtract(Duration(days:1));
                    Provider.of<ReportsProvider>(context, listen: false).calculateAvg(widget.cleanMap);
                    Navigator.of(context).pop();
                  }
                ),
              ),
            ),
          ),
        ],),
      ],)
    ] 
  );

  }

}


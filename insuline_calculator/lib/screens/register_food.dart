import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/dynamic_text_field.dart';
import 'package:insuline_calculator/widgets/dropdown_menu.dart';



class RegisterFood extends StatefulWidget {
  const RegisterFood({super.key});

  @override
  State<RegisterFood> createState() => _RegisterFoodState();
}

class _RegisterFoodState extends State<RegisterFood> {
  final controllerNombre= TextEditingController();
  final controllerDescripcion= TextEditingController();
  final controllerPorcion= TextEditingController();
  final controllerCarbs= TextEditingController();
  final controller5= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text("Registro de un alimento", style:TextStyle(color: Colors.white))),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,20.0,0,15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text field generico que acepta el controllador para leer el input
              DynamicTextField(myController: controllerNombre,height: 50, width: 280, textInputType: TextInputType.multiline, 
                label: "Nombre del alimento",maxlines: 1,minlines: 1,), 
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 240,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                    image: DecorationImage(
                      image: NetworkImage('https://www.pequerecetas.com/wp-content/uploads/2020/10/tacos-mexicanos.jpg'), 
                      fit: BoxFit.cover, 
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 170,
                height:40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20, color:Colors.white),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ), onPressed: () {  }, 
                  child: const Text('Agregar imagen',style: TextStyle(fontSize: 15, color:Colors.white)),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
                child: DynamicTextField(myController: controllerDescripcion, height: 95, width: 300, textInputType: TextInputType.multiline, 
                  label: "Descripción del alimento", maxlines: 3, minlines: 3),
              ), 
              Padding(
                padding: const EdgeInsets.fromLTRB(50,10,50,2),
                child: Row(children: [
                  Expanded(child: 
                      Container(
                        height: 125,
                        child: Column(
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Tamaño porción"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DynamicTextField(myController: controllerPorcion, height: 60, width: 120, textInputType: TextInputType.number,
                            label: "Cantidad", maxlines: 1, minlines: 1),
                          ),

                        ]),
                      ),
                    ),
              
                    Expanded(child: 
                      Container(
                        height: 125,
                        child: Column(
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Unidad alimento"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownMenuExample()
                          ),
                        ]),
                      ),
                    ),
                ],),
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("Carbs"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26.0),
                        child: DynamicTextField(myController: controllerCarbs, height: 60, width: 120, textInputType: TextInputType.number,
                        label: "Cantidad", maxlines: 1, minlines: 1),
                      ),
                      ],)
              ],),

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
                  child: const Text('Terminar',style: TextStyle(fontSize: 15, color:Colors.white)),
                )
              ),
            ],),
          ),
      ),
    );
  }
}
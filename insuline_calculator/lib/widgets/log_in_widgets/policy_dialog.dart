import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatelessWidget {
  
  PolicyDialog({super.key, 
    this.radius = 10,
    required this.mdFileName,
  }): assert(mdFileName.contains('.md'),);

  final double radius;
  final String mdFileName;

  @override
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.fromLTRB(20,15,20,7),
      actionsPadding: EdgeInsets.fromLTRB(0,8,0,15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      title: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: Theme.of(context).primaryColor,),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        child: mdFileName == "aviso_privacidad.md"
          ? Text('Política de Privacidad', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),)
          : Text('Términos y Condiciones', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),)),

      content: 
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.2,
          minWidth: MediaQuery.of(context).size.width/1.2,
          maxHeight: MediaQuery.of(context).size.height/2.2,
          ),
            child: Column(
              children: [ Expanded(
                child: FutureBuilder(
                  future: Future.delayed(Duration(milliseconds: 150)).then((value) {
                    return rootBundle.loadString('assets/politicas/$mdFileName');
                  }),
                  builder:(context, snapshot) {
                    if(snapshot.hasData){
                      return Markdown(
                        data: snapshot.data!,
                         );
                    }
                    return Center(child: CircularProgressIndicator());
                  },)
              )
                
            ])
          ),

      actions: [Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7)
            )
          ),
          child: Text('Cerrar',style: TextStyle(fontSize: 15, color: Colors.white),),
          onPressed: () {
            Navigator.of(context).pop(); 
          },
        ),
      )],
    );
  }

}
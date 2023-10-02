import 'package:flutter/material.dart';

class DynamicTextField extends StatelessWidget {
  final TextEditingController myController;
  final double width;
  final double height;
  final dynamic textInputType; 
  final String label;
  final int? maxlines;
  final int? minlines;

  DynamicTextField({super.key, required this.myController, required this.height, required this.width, 
    required this.textInputType, required this.label, required this.maxlines, required this.minlines});  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                  width: width,
                  height: height,
                  child: TextField(
                    controller: myController,
                    obscureText: false,
                    keyboardType: textInputType,
                    minLines: minlines,
                    maxLines: maxlines,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor)
                      ),
                      label:  Center(child: Text(label)),
                      alignLabelWithHint: true,
                    ),
                  ),
                );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:insuline_calculator/classes/food.dart'; //para transformar despues a objeto food
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'package:insuline_calculator/screens/register_food.dart';
import 'package:provider/provider.dart';

class MainFoodListItem extends StatelessWidget {
  const MainFoodListItem({super.key, required this.item, required this.index});

  final AZFoodListItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              //abrir pagina de edicion de alimento pero con los valores precargados, pasando objeto food de parametro
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterFood()));
            },
            backgroundColor: Colors.green,
            foregroundColor: Theme.of(context).secondaryHeaderColor,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (context) {
              Provider.of<StorageProvider>(context, listen: false)
                  .deleteAzListFoodItem(context, index);
            },
            backgroundColor: Colors.red,
            foregroundColor: Theme.of(context).secondaryHeaderColor,
            icon: Icons.delete,
          )
        ]),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6, right: 20, top: 5, bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.file(
                  File(item.imageUrl),
                  width: 63,
                  height: 63,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 1.6,
                    minWidth: MediaQuery.of(context).size.width / 1.6,
                  ),
                  child: Text(
                    item.description,
                    style: TextStyle(
                        fontSize: 16.0,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

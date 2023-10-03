import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:insuline_calculator/classes/food.dart'; //para transformar despues a objeto food
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/screens/register_food.dart';

class MainFoodListItem extends StatelessWidget {
  const MainFoodListItem({super.key, required this.item});

  final AZFoodListItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).secondaryHeaderColor,
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
              //llamar funcion eliminar del provider
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
                child: Image(
                  image: NetworkImage(item.imageUrl),
                  height: 63,
                  width: 63,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                    ),
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

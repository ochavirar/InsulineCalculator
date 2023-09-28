import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BolusFoodItem extends StatefulWidget {
  const BolusFoodItem({super.key});

  @override
  State<BolusFoodItem> createState() => _BolusFoodItemState();
}

void deleteItem(context) {}
void editItem(context) {
  //mostrar el dialog de la edicion de la comida
}

class _BolusFoodItemState extends State<BolusFoodItem> {
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
            onPressed: editItem,
            backgroundColor: Colors.green,
            foregroundColor: Theme.of(context).secondaryHeaderColor,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: deleteItem,
            backgroundColor: Colors.red,
            foregroundColor: Theme.of(context).secondaryHeaderColor,
            icon: Icons.delete,
          )
        ]),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 6, right: 20, top: 5, bottom: 5),
              child: Image(
                image: NetworkImage(
                    'https://www.thewholesomedish.com/wp-content/uploads/2019/06/The-Best-Classic-Tacos-550.jpg'),
                height: 63,
                width: 63,
              ),
            ),
            const Column(
              children: [
                Text(
                  'Zucaritas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '30 grams',
                  style: TextStyle(),
                )
              ],
            ),
            Expanded(child: Container()),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                '27 Carbs',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

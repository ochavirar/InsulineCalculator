import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'change_food_dialog.dart';
import 'package:insuline_calculator/classes/food_detail.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';

class BolusFoodItem extends StatefulWidget {
  const BolusFoodItem({super.key, required this.detalle});

  final FoodDetail detalle;

  @override
  State<BolusFoodItem> createState() => _BolusFoodItemState();
}

void openEditDialog(context, FoodDetail detalle) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditFoodDialog(food: detalle.alimento, edit: true);
      });
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
            onPressed: (context) {
              openEditDialog(context, widget.detalle);
            },
            backgroundColor: Colors.green,
            foregroundColor: Theme.of(context).secondaryHeaderColor,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (context) {
              context.read<BolusProvider>().deleteFood(widget.detalle.alimento);
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
                  image: NetworkImage(widget.detalle.alimento.imageUrl),
                  height: 63,
                  width: 63,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  widget.detalle.alimento.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.detalle.quantity.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                '${((widget.detalle.quantity * widget.detalle.alimento.basecarbs) / widget.detalle.alimento.baseServingSize).toStringAsFixed(2)} Carbs',
                style: const TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
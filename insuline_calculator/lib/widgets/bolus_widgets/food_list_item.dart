import 'package:flutter/material.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/classes/food.dart';
import 'change_food_dialog.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.item});

  final AZFoodListItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 20),
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                //falta convertir el AZ a un food normal denuevo para pasarlo de parametro a editFood
                Food foodItem = Food(
                    title: item.title,
                    unit: item.unit,
                    baseServingSize: item.baseServingSize,
                    basecarbs: item.basecarbs,
                    description: item.description,
                    imageUrl: item.imageUrl);
                return EditFoodDialog(food: foodItem, edit: false);
              });
        },
        splashColor: Colors.blue.withAlpha(30),
        child: Row(
          children: [
            // Network Image
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                item.imageUrl,
                width: 80, //ajustable
                height: 80, //toda la height
                //fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                // Title
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.6,
                      minWidth: MediaQuery.of(context).size.width / 1.6,
                    ),
                    child: Text(
                      item.description,
                      style: TextStyle(
                        fontSize: 16.0,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
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

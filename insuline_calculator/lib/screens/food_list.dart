import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import 'package:insuline_calculator/classes/food.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/dummy_data/dummy_data.dart';
import 'package:insuline_calculator/widgets/food_list_item.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

List<AZFoodListItem> getCorrectListType() {
  List<dynamic> valores = dummyFood; //este sera recuperado del api despues
  List<AZFoodListItem> newvalues = [];

  for (Food alimento in valores) {
    newvalues.add(AZFoodListItem(
        tag: alimento.title[0],
        title: alimento.title,
        unit: alimento.unit,
        baseServingSize: alimento.baseServingSize,
        basecarbs: alimento.basecarbs,
        description: alimento.description,
        imageUrl: alimento.imageUrl));
  }

  return newvalues;
}

class _FoodListState extends State<FoodList> {
  List<AZFoodListItem> items = getCorrectListType();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista Alimentos',
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AzListView(
          data: items,
          itemCount: dummyFood.length,
          itemBuilder: (BuildContext context, int index) {
            return FoodListItem(item: items[index]);
          }),
    );
  }
}

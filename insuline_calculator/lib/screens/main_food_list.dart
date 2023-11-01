import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/food_list.dart';
import 'package:insuline_calculator/screens/register_food.dart';
import 'package:insuline_calculator/classes/food.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/dummy_data/dummy_data.dart';
import 'package:azlistview/azlistview.dart';
import 'package:insuline_calculator/widgets/bolus_widgets/main_food_list_item.dart';
import 'package:insuline_calculator/widgets/utilities/side_bar.dart';

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

class MainFoodList extends StatelessWidget {
  MainFoodList({super.key});

  List<AZFoodListItem> items = getCorrectListType();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: Text(
          'Lista Alimentos',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterFood()));
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          Expanded(
            child: AzListView(
                data: items,
                itemCount: dummyFood.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainFoodListItem(item: items[index]);
                }),
          ),
        ],
      ),
    );
  }
}

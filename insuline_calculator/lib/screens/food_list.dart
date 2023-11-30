import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
import 'package:insuline_calculator/classes/food.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/dummy_data/dummy_data.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'package:insuline_calculator/widgets/bolus_widgets/food_list_item.dart';
import 'package:provider/provider.dart';

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
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FutureBuilder(
        future: Provider.of<StorageProvider>(context).getAzListFood(context),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator()
                ],)
                ]
            );
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text("No hay alimentos guardados", style: TextStyle(fontSize: 18))
              ]);
          }
          else{
            items = Provider.of<StorageProvider>(context).listFood;
            return 
            AzListView(
              data: items,
              itemCount: dummyFood.length,
              itemBuilder: (BuildContext context, int index) {
              return FoodListItem(item: items[index]);
            });
          }

        }
        
        
      ),
    );
  }
}

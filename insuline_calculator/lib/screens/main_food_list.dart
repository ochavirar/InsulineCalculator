// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'package:insuline_calculator/screens/register_food.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:azlistview/azlistview.dart';
import 'package:insuline_calculator/widgets/bolus_widgets/main_food_list_item.dart';
import 'package:provider/provider.dart';

class MainFoodList extends StatefulWidget {
  const MainFoodList({super.key});

  @override
  State<MainFoodList> createState() => _MainFoodListState();
}

class _MainFoodListState extends State<MainFoodList> {
  List<AZFoodListItem> items = [];

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
      body: FutureBuilder<void>(
        future:Provider.of<StorageProvider>(context).getAzListFood(context),
        builder:(context,snapshot) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterFood()));
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
                Text("No hay alimentos guardados", style: TextStyle(fontSize: 18))
              ]);
          }
          else{
            items = Provider.of<StorageProvider>(context).listFood;
            return Column(
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
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MainFoodListItem(item: items[index],index: index);
                      }),
                ),
              ],
            );
          }
        }
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:insuline_calculator/classes/az_food_list.dart';
import 'package:insuline_calculator/providers/storage_provider.dart';
import 'package:insuline_calculator/screens/update_food.dart';
import 'package:provider/provider.dart';

class MainFoodListItem extends StatelessWidget {
  const MainFoodListItem({super.key, required this.item, required this.index, required this.name, 
    required this.path, required this.onPressedCallBack});

  final AZFoodListItem item;
  final int index; 
  final String name;
  final String path;
  final VoidCallback onPressedCallBack;

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
              Provider.of<StorageProvider>(context, listen: false).selectedFood = name;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UpdateFood()));
            },
            backgroundColor: Colors.green,
            foregroundColor: Theme.of(context).secondaryHeaderColor,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (context) async{
              Provider.of<StorageProvider>(context, listen: false).indexToChange = index;
              Provider.of<StorageProvider>(context, listen: false)
                .deleteAzListFoodItem(context, index, name, path)
                .then((value) => onPressedCallBack(),);
              
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
                child: FutureBuilder<Uint8List> (
                  future: Provider.of<StorageProvider>(context, listen: false).getFirebaseImage(item.imageUrl),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }
                    else if (snapshot.hasError) {
                      // Show an error message if the future completes with an error
                      return Image.asset("assets/images/not_loaded.jpg", width: 63, height: 63);
                    }
                    else{
                      //print(snapshot.data);
                      return Image.memory(snapshot.data!, width: 63, height: 63);
                    }
                  }
                  )
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

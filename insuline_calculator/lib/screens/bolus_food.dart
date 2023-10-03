import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/bolus_widgets/bolus_food_item.dart';

import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'food_list.dart';

class BolusFood extends StatefulWidget {
  const BolusFood({super.key});

  @override
  State<BolusFood> createState() => _BolusFoodState();
}

class _BolusFoodState extends State<BolusFood> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Theme.of(context).splashColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Total de alimentos: ${context.watch<BolusProvider>().carbSum.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: context.watch<BolusProvider>().boloTest.foodList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return BolusFoodItem(
                  detalle:
                      context.watch<BolusProvider>().boloTest.foodList[index]);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.all(14),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodList()));
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

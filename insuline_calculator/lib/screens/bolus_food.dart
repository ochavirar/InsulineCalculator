import 'package:flutter/material.dart';

import 'package:insuline_calculator/widgets/bolus_food_item.dart';

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
                'Total de alimentos: ' + 'xnum',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        Column(
          children: [
            BolusFoodItem(),
            BolusFoodItem(),
            BolusFoodItem(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(14),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

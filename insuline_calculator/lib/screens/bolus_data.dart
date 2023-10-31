import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/bolus_widgets/change_glucose_dialog.dart';
import 'package:provider/provider.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';

class BolusData extends StatefulWidget {
  const BolusData({super.key});

  @override
  State<BolusData> createState() => _BolusDataState();
}

class _BolusDataState extends State<BolusData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Informacion de Bolus',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Alimentos',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        '${context.watch<BolusProvider>().carbSum.toStringAsFixed(2)} Carbs',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${context.watch<BolusProvider>().carbInsulin.toStringAsFixed(2)} Units',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          //height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Glucosa',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 60),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          context
                              .watch<BolusProvider>()
                              .boloTest
                              .glucosa
                              .toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'mg/dl',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onTertiary,
                        ),
                        child: const Text(
                          'Editar',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ChangeGlucoseDialog();
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${context.watch<BolusProvider>().glucoseInsulin.toStringAsFixed(2)}  Units',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Calculo Insulina',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Carbs',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${context.watch<BolusProvider>().carbInsulin.toStringAsFixed(2)} Units',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Glucosa',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${context.watch<BolusProvider>().glucoseInsulin.toStringAsFixed(2)} Units',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${(context.watch<BolusProvider>().glucoseInsulin + context.watch<BolusProvider>().carbInsulin).toStringAsFixed(2)} Units',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    foregroundColor: Theme.of(context).colorScheme.onTertiary),
                child: const Text(
                  'Guardar',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insuline_calculator/providers/bolus_provider.dart';
import 'package:insuline_calculator/screens/bolus_history.dart';
import 'package:insuline_calculator/screens/edit_profile.dart';
import 'package:insuline_calculator/screens/main_food_list.dart';
import 'package:insuline_calculator/screens/reports.dart';
import 'package:insuline_calculator/screens/sensibility_settings.dart';
import 'package:insuline_calculator/widgets/utilities/adaptable_text.dart';
import 'package:insuline_calculator/screens/main_bolus.dart';
import 'package:provider/provider.dart';

class MainScreenContainer extends StatelessWidget {
  const MainScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreenScaffold();
  }
}

class MainScreenScaffold extends StatelessWidget {
  const MainScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
            child: Text(
          'INICIO',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        )),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            iconSize: 40,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditProfile()));
            },
          ),
        ],
      ),
      // drawer: const SideBar(),
      body: const SingleChildScrollView(child: ContentContainer()),
    );
  }
}

class ContentContainer extends StatelessWidget {
  const ContentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: const ColumnContainer(),
      ),
    );
  }
}

class ColumnContainer extends StatelessWidget {
  const ColumnContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
            'assets/images/main_image.jpg'),
        const LeftAlignmentText(),
        const StackNavigation()
      ],
    );
  }
}

class LeftAlignmentText extends StatelessWidget {
  const LeftAlignmentText({super.key});

  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser!;

    String mailID = user.email ?? 'error';
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Bienvenido $mailID",
        ),
      ),
    );
  }
}

class StackNavigation extends StatelessWidget {
  const StackNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Theme.of(context).secondaryHeaderColor,
      child: const ButtonsContainer(),
    );
  }
}

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LongButton(text: "Calcular Bolus", target: MainBolusScreen()),
        DoubleShortButtonContainer(
            text1: "Historial",
            text2: "Configurar Sensibilidad",
            target1: BolusHistory(),
            target2: SensibilitySettings()),
        DoubleShortButtonContainer(
            text1: "Lista de alimentos",
            text2: "Reportes",
            target1: MainFoodList(),
            target2: Reports())
      ],
    );
  }
}

class LongButton extends StatelessWidget {
  const LongButton({super.key, required this.text, required this.target});

  final String text;
  final Widget target;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => target));
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ShortButton extends StatelessWidget {
  const ShortButton({super.key, required this.text, required this.target});

  final String text;
  final Widget target;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.36,
                MediaQuery.of(context).size.height * 0.15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () async {
            await Provider.of<BolusProvider>(context, listen:false).createHistoryMap();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => target));
          },
          child: AdaptableText(text,
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold))),
    );
  }
}

class DoubleShortButtonContainer extends StatelessWidget {
  const DoubleShortButtonContainer(
      {super.key,
      required this.text1,
      required this.text2,
      required this.target1,
      required this.target2});

  final String text1;
  final String text2;
  final Widget target1;
  final Widget target2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ShortButton(text: text1, target: target1),
        const Spacer(),
        ShortButton(text: text2, target: target2)
      ],
    );
  }
}

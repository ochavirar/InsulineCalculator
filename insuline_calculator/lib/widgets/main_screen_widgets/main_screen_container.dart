import 'package:flutter/material.dart';
import 'package:insuline_calculator/screens/edit_profile.dart';
import 'package:insuline_calculator/widgets/utilities/adaptable_text.dart';
import 'package:insuline_calculator/widgets/utilities/side_bar.dart';

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
        title: const Center(child: Text('INICIO')),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            iconSize: 40,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
            },
          ),
        ],
      ),
      drawer: const SideBar(),
      body: const SingleChildScrollView(
        child: ContentContainer()
      ),
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
        Image.network('https://cdn.dribbble.com/users/937082/screenshots/5516643/blob_4x'),
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
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: const Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Bienvenido [Username]",
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
        color: Theme.of(context).secondaryHeaderColor,
        child: const ButtonsContainer(),
      );
  }
}

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        LongButton(text: "Calcular Bolus"),
        DoubleShortButtonContainer(text1: "Historial", text2: "Configurar factor de sensibilidad"),
        DoubleShortButtonContainer(text1: "Lista de alimentos", text2: "Reportes")
      ],
    );
  }
}

class LongButton extends StatelessWidget {
  const LongButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            double.infinity,
            MediaQuery.of(context).size.height * 0.1 
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {}, 
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class  ShortButton extends StatelessWidget {
  const ShortButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(
            MediaQuery.of(context).size.width * 0.36, 
            MediaQuery.of(context).size.height * 0.15 
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {}, 
        child: AdaptableText(text, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))
      ),
    );
  }
}

class DoubleShortButtonContainer extends StatelessWidget {
  const DoubleShortButtonContainer({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ShortButton(text: text1),
        const Spacer(),
        ShortButton(text: text2)
      ],
    );
  }
}
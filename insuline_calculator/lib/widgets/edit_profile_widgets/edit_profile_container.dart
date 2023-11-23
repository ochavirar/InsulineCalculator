import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/edit_profile_widgets/edit_profile_form.dart';

class EditProfileContainer extends StatelessWidget {
  const EditProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar perfil',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.person,
        //       size: 40,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      //drawer: const SideBar(),
      body: const Center(
        child: EditProfileForm(),
      ),
    );
  }
}

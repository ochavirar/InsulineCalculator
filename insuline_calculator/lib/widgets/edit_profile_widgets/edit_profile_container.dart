import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/edit_profile_widgets/edit_profile_form.dart';
import 'package:insuline_calculator/widgets/utilities/side_bar.dart';

class EditProfileContainer extends StatelessWidget {
  const EditProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              size: 40,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const SideBar(),
      body: const Center(
        child: EditProfileForm(),
      ),
    );
  }
}
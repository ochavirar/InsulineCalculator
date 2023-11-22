import 'package:flutter/material.dart';
import 'package:insuline_calculator/widgets/edit_profile_widgets/change_form.dart';
import 'theme_logout.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NameChangeForm(),
        PasswordChangeForm(),
        BottomEditProfilePage()
      ],
    );
  }
}

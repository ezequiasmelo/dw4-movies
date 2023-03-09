import 'package:dw4_movies_app/modules/profile/profile_update_name/profile_update_name_controller.dart';
import 'package:flutter/material.dart';
import '../../../application/ui/page_state.dart';
import '../../../application/ui/widgets/text_field_widget.dart';

class ProfileUpdateNamePage extends StatefulWidget {
  const ProfileUpdateNamePage({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateNamePage> createState() => _ProfileUpdateNamePageState();
}

class _ProfileUpdateNamePageState
    extends PageState<ProfileUpdateNamePage, ProfileUpdateNameController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar Nome'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldWidget(
                label: 'Nome',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

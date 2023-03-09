import 'package:dw4_movies_app/application/ui/page_state.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './profile_controller.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends PageState<ProfilePage, ProfileController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 95.0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.grey[400],
                  size: 80,
                ),
              ),
              divider,
              Text('Informação pessoal'),
              divider,
              // TextFieldWidget(
              //   label: 'Nome',
              // ),
              // divider,
              // TextFieldWidget(
              //   label: 'Email',
              // )
            ],
          ),
        ),
      ),
    );
  }
}

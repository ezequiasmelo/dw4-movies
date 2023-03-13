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
  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 95.0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                divider,
                Text('Dados pessoais'),
              ],
            ),
          ),
          ListTile(
            title: Text('Nome'),
            subtitle: Text('Ezequias'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text('ezequias@email.com'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

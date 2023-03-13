import 'package:dw4_movies_app/modules/auth/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../../application/ui/page_state.dart';
import '../../../application/ui/widgets/app_button_widget.dart';
import '../../../application/ui/widgets/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends PageState<SignUpPage, SignUpController> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signUp() {
    _formKey.currentState!.save();
    controller.register(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 95.0));
    // final appTheme = Get.find<AppThemeInterface>();

    return Scaffold(
      // appBar: AppBarWidget(),
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      // backgroundColor: appTheme.colors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            controller.formValid(_formKey.currentState!.validate());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Cadastro',
              //   // style: appTheme.textStyles.heading2,
              // ),
              divider,
              const Text(
                'Preencha os campos abaixo para criar o seu cadastro.',
              ),
              divider,
              TextFieldWidget(
                label: 'Nome*',
                controller: _nameController,
                validator: Validatorless.required('O campo nome é obrigatório'),
              ),
              divider,
              TextFieldWidget(
                label: 'E-mail*',
                controller: _emailController,
                validator: Validatorless.multiple([
                  Validatorless.required('O campo e-mail é obrigatório'),
                  Validatorless.email('O e-mail informado é inválido')
                ]),
              ),
              divider,
              TextFieldWidget(
                label: 'Senha*',
                controller: _passwordController,
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required('A senha é obrigatória'),
                  Validatorless.min(
                      6, 'A senha deve conter pelo menos 6 caracteres')
                ]),
              ),
              divider,
              TextFieldWidget(
                label: 'Confirme sua Senha*',
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required('Confirme sua senha é obrigatório'),
                  Validatorless.compare(_passwordController,
                      'Os campos senha e confirme sua senha tem valores diferentes')
                ]),
              ),
              divider,
              Obx(
                () => AppButtonWidget(
                  child: const Text('Cadastrar'),
                  onPressed: controller.formValid.isTrue ? _signUp : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

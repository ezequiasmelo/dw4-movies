import 'package:dw4_movies_app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../../application/ui/page_state.dart';
import '../../../application/ui/widgets/app_button_widget.dart';
import '../../../application/ui/widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends PageState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 90.0));
    // final appTheme = Get.find<AppThemeInterface>();

    return Scaffold(
      // appBar: AppBarWidget(),
      // backgroundColor: appTheme.colors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            // controller.formValid(_formKey.currentState!.validate());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastro',
                // style: appTheme.textStyles.heading2,
              ),
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

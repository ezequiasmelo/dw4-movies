import 'package:dw4_movies_app/application/ui/page_state.dart';
import 'package:dw4_movies_app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../../application/constants/app_routes.dart';
import '../../../application/ui/widgets/app_button_widget.dart';
import '../../../application/ui/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends PageState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _login() {
    _formKey.currentState!.save();
    controller.login(
        email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(height: context.widthTransformer(reducedBy: 95.0));
    // final appTheme = Get.find<AppThemeInterface>();

    return Scaffold(
      // appBar: AppBarWidget(),
      appBar: AppBar(
        title: Text('Login'),
      ),
      // backgroundColor: appTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            controller.formValid(_formKey.currentState!.validate());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Login',
                  //   // style: appTheme.textStyles.heading2
                  // ),
                  divider,
                  TextFieldWidget(
                    label: 'E-mail',
                    controller: _emailController,
                    validator: Validatorless.multiple([
                      Validatorless.required('O e-mail é obrigatório'),
                      Validatorless.email('O e-mail informado é inválido')
                    ]),
                  ),
                  divider,
                  TextFieldWidget(
                    label: 'Senha',
                    obscureText: true,
                    controller: _passwordController,
                    validator: Validatorless.multiple([
                      Validatorless.required('A senha é obrigatória'),
                      // Validatorless.min(
                      //     6, 'A senha deve conter pelo menos 6 caracteres')
                    ]),
                  ),
                  divider,
                  Obx(
                    () => AppButtonWidget(
                      child: const Text('Entrar'),
                      onPressed: controller.formValid.isTrue ? _login : null,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não possui uma conta?'),
                  TextButton(
                    child: Text(
                      'Cadastre-se',
                      // style: appTheme.textStyles.textBold
                    ),
                    onPressed: () => Get.toNamed(AppRoutes.signUp),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

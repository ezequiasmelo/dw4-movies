import 'package:dw4_movies_app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: Get.width * .9,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () => controller.login(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text('Entrar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
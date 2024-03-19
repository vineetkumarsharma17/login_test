import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_test/controllers/main_controller.dart';

import '../../../helper/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/textfields.dart';

class SignUpView extends GetView<MainController> {
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text.rich(TextSpan(
                      text: "Welcome ",
                      style: AppTextStyle.h1,
                      children: <InlineSpan>[
                        TextSpan(
                          // recognizer: TapGestureRecognizer()
                          // ..onTap = () => Get.to(() => SignUpView()),
                          text: '\nBack!',
                          style: AppTextStyle.h2,
                        ),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: controller.emailCtrl,
                    fieldName: "Email *",
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: controller.passwordCtrl,
                    fieldName: "Password *",
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(
                          text: "Already have  an account? ",
                          children: <InlineSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back(),
                              text: 'Log In',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ])),
                    ],
                  ),
                ],
              ),
            ),
            AppButton(
              text: "Sign Up",
              onPressed: () => mainController.signUp(),
              backgroundColor:
                  controller.isLoginButtonActive.value ? null : AppColors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}

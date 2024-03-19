import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_test/controllers/main_controller.dart';

import '../../../helper/theme.dart';
import '../signup/signup_view.dart';
import '../widgets/buttons.dart';
import '../widgets/textfields.dart';

class ForgotPasswordView extends GetView<MainController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text("Forgot Password")),
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
                      text: "Verify",
                      style: AppTextStyle.h1,
                      children: <InlineSpan>[
                        TextSpan(
                          // recognizer: TapGestureRecognizer()
                          // ..onTap = () => Get.to(() => SignUpView()),
                          text: '\nyour Email!',
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
                    onChanged: (p0) {
                      controller.isLoginButtonActive.value =
                          controller.validateEmail();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Obx(
              () => AppButton(
                text: "Submit",
                onPressed: () => mainController.forgotPassword(),
                backgroundColor: controller.isLoginButtonActive.value
                    ? null
                    : AppColors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}

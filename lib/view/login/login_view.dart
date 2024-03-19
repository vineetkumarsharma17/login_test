import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_test/controllers/main_controller.dart';
import 'package:login_test/view/forgot_password/forgot_password_view.dart';

import '../../../helper/theme.dart';
import '../signup/signup_view.dart';
import '../widgets/buttons.dart';
import '../widgets/textfields.dart';

class LogInView extends GetView<MainController> {
  LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text("Log In")),
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
                    onChanged: (p0) {
                      controller.isLoginButtonActive.value =
                          controller.validateEmailAndPassword();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: controller.passwordCtrl,
                    fieldName: "Password *",
                    hintText: "Password",
                    onChanged: (p0) {
                      controller.isLoginButtonActive.value =
                          controller.validateEmailAndPassword();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.to(() => ForgotPasswordView()),
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyle.linkText,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(
                          text: "Don't have  an account? ",
                          children: <InlineSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpView()),
                              text: 'Sign Up',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ])),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.signInWithGoogle();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGreyText),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-google-icon-logo-png-transparent-svg-vector-bie-supply-14.png",
                              width: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Log in with Google")
                          ]),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () {
                log("updated");
                return AppButton(
                  text: "Log In",
                  onPressed: () => mainController.logIn(),
                  backgroundColor: controller.isLoginButtonActive.value
                      ? null
                      : AppColors.grey,
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}

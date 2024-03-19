import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:login_test/controllers/main_controller.dart';
import 'package:login_test/view/widgets/buttons.dart';

class HomeView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome User")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "User is Logged in with  email : ${controller.auth.currentUser!.email}"),
            SizedBox(
              height: 22,
            ),
            AppButton(
                text: "Log Out",
                onPressed: () {
                  controller.auth.signOut();
                })
          ],
        ),
      ),
    );
  }
}

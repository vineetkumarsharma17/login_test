import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_test/helper/helper.dart';
import 'package:login_test/view/home/home_view.dart';
import 'package:login_test/view/login/login_view.dart';

import '../view/widgets/show_loading.dart';

class MainController extends GetxController {
  static MainController instance = Get.find();
  Rx<User?> user = Rx<User?>(null);
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoginButtonActive = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FirebaseAuth.instance.userChanges().listen(handleUser);
  }

  void handleUser(User? user) {
    Future.delayed(Duration(seconds: 2), () {
      if (user == null) {
        Get.offAll(() => LogInView());
      } else {
        Get.offAll(() => HomeView());
      }
    });
  }

  void logIn() async {
    // hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    if (emailCtrl.text.isEmpty) {
      Helpers.toast("Please enter email.");
      return;
    }
    if (!Helpers.isValidEmail(emailCtrl.text.trim())) {
      Helpers.toast("Please enter a valid email.");
      return;
    }
    if (passwordCtrl.text.isEmpty) {
      Helpers.toast("Please enter password.");
      return;
    }
    if (!Helpers.isValidPassword(passwordCtrl.text.trim())) {
      Helpers.toast('Password must contain at least 8 characters, '
          '1 uppercase letter, 1 lowercase letter, '
          '1 numeric digit, and 1 special character.');
      return;
    }
    showLoading();
    try {
      await auth.signInWithEmailAndPassword(
          email: emailCtrl.text.trim(), password: passwordCtrl.text.trim());
      dismissLoadingWidget();
      // .then((value) => value)
      // .catchError((error, stackTrace) => );
    } on FirebaseAuthException catch (e) {
      dismissLoadingWidget();
      log("log in firebase error:$e");
      switch (e.code) {
        case 'invalid-credential':
        case 'user-not-found':
          Helpers.toast('Email or password incorrect.');
          break;
        default:
          Helpers.toast(e.message ?? "");
      }
    } catch (e) {
      dismissLoadingWidget();
      print("log in catch error:$e");
      Helpers.toast(e.toString());
    }
  }

  void signUp() async {
    // hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    if (emailCtrl.text.isEmpty) {
      Helpers.toast("Please enter email.");
      return;
    }
    if (!Helpers.isValidEmail(emailCtrl.text.trim())) {
      Helpers.toast("Please enter a valid email.");
      return;
    }
    if (passwordCtrl.text.isEmpty) {
      Helpers.toast("Please enter password.");
      return;
    }
    if (!Helpers.isValidPassword(passwordCtrl.text.trim())) {
      Helpers.toast('Password must contain at least 8 characters, '
          '1 uppercase letter, 1 lowercase letter, '
          '1 numeric digit, and 1 special character.');
      return;
    }
    showLoading();
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailCtrl.text.trim(), password: passwordCtrl.text.trim());
      dismissLoadingWidget();
      // .then((value) => value)
      // .catchError((error, stackTrace) => );
    } on FirebaseAuthException catch (e) {
      dismissLoadingWidget();
      log("signup in firebase error:$e");
      switch (e.code) {
        case 'email-already-in-use':
          Helpers.toast('The account already exists for that email.');
          break;
        default:
          Helpers.toast(e.message ?? "");
      }
    } catch (e) {
      dismissLoadingWidget();
      print("log in catch error:$e");
      Helpers.toast(e.toString());
    }
  }

  void forgotPassword() async {
    // hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    if (emailCtrl.text.isEmpty) {
      Helpers.toast("Please enter email.");
      return;
    }
    if (!Helpers.isValidEmail(emailCtrl.text.trim())) {
      Helpers.toast("Please enter a valid email.");
      return;
    }
    showLoading();
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailCtrl.text.trim(), password: passwordCtrl.text.trim());
      dismissLoadingWidget();
      // .then((value) => value)
      // .catchError((error, stackTrace) => );
    } on FirebaseAuthException catch (e) {
      dismissLoadingWidget();
      log("signup in firebase error:$e");
      switch (e.code) {
        case 'email-already-in-use':
          Helpers.toast('The account already exists for that email.');
          break;
        default:
          Helpers.toast(e.message ?? "");
      }
    } catch (e) {
      dismissLoadingWidget();
      print("log in catch error:$e");
      Helpers.toast(e.toString());
    }
  }

  bool validateEmail() {
    if (emailCtrl.text.isEmpty) {
      return false;
    }
    if (!Helpers.isValidEmail(emailCtrl.text.trim())) {
      return false;
    }
    return true;
  }

  bool validatePassword() {
    if (passwordCtrl.text.isEmpty) {
      return false;
    }
    if (!Helpers.isValidEmail(passwordCtrl.text.trim())) {
      return false;
    }
    return true;
  }

  bool validateEmailAndPassword() {
    if (emailCtrl.text.isEmpty) {
      return false;
    }
    if (!Helpers.isValidEmail(emailCtrl.text.trim())) {
      return false;
    }
    if (passwordCtrl.text.isEmpty) {
      return false;
    }
    if (!Helpers.isValidPassword(passwordCtrl.text.trim())) {
      return false;
    }
    return true;
  }
}

MainController mainController = MainController.instance;

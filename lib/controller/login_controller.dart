import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';

import '../constants/strings.dart';
import '../model/services/auth_sercives.dart';


class LoginController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isLoginClicked = false;
  String email = "";
  String password = "";
  GlobalKey<FormState> loginFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = "";
    password ="";
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isLoginClicked) {
      loginFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To login, and check if the user is on guest account or not to.
  Future<void> login() async {
    isLoading = true;
    isLoginClicked = true;
    checkFields();
    if (loginFormStateKey.currentState!.validate()) {
      loginFormStateKey.currentState!.save();
      dynamic loginResponse = await FirebaseAuthService().login(email, password);
      if (loginResponse is User) {
        Get.offNamed(AppStrings.splashRoute);
      } else {
        loginResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }
}
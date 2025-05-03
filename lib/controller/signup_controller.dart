
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';

import '../constants/strings.dart';
import '../model/services/auth_sercives.dart';
import '../model/services/firebase_services.dart';
import '../model/user_model.dart';

class SignUpController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isSignUpClicked = false;
  String parent_name = AppStrings.emptySign;
  int isGuardian = 1;
  String guardian = AppStrings.emptySign;
  String guardian_name = AppStrings.emptySign;
  String guardian_number = AppStrings.emptySign;
  String child_name = AppStrings.emptySign;
  String child_email = AppStrings.emptySign;
  String child_number = AppStrings.emptySign;
  String child_dob = AppStrings.emptySign;
  String password = AppStrings.emptySign;
  GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    child_email = AppStrings.emptySign;
    password = AppStrings.emptySign;
    child_name = AppStrings.emptySign;
    child_number = AppStrings.emptySign;
    child_dob = AppStrings.emptySign;
    parent_name = AppStrings.emptySign;
    guardian = AppStrings.emptySign;
    guardian_number = AppStrings.emptySign;
    isGuardian = 1;

    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isSignUpClicked) {
      signUpFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To sign up.
  Future<void> signUp() async {
    isLoading = true;
    isSignUpClicked = true;
    checkFields();
    if (signUpFormStateKey.currentState!.validate()) {
      signUpFormStateKey.currentState!.save();
      dynamic signUpResponse = await FirebaseAuthService().signUp(child_email, password);
      if (signUpResponse is User) {
        //FirebaseAuthService().signOut();
        if(isGuardian==1){
          guardian = "father";
        }else{
          guardian = "mother";
        }
        UserModel user = UserModel(
          parentName: parent_name,
          guardian: guardian,
          guardianNumber: guardian_number,
          childName: child_name,
          childEmail: child_email,
          childNumber: child_number,
          childDob: child_dob,
          isAutism: false,
        );
        dynamic uploadUserResponse = await FirebaseServices.uploadUser(user);
        if (uploadUserResponse is UserModel) {
          Get.offNamed(AppStrings.autismTestRoute);
        } else {
          uploadUserResponse.toString().showToast;
        }
      } else {
        signUpResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }
}
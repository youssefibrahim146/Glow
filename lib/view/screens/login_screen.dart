
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controller/login_controller.dart';
import '../widgets/form_field_widget.dart';
import '../widgets/hero_widget.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Scaffold(
        //backgroundColor: AppColors.lightBlueColor,
        body: SafeArea(
          child: Padding(
            padding: 35.edgeInsetsHorizontal,
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: controller.loginFormStateKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(tag: AppStrings.logoTag, child: Center(child: Image.asset("assets/login.png", height: 110, width: 250))),
                      10.gap,
                      const HeroWidget(
                        tag: AppStrings.titleTag,
                        child: Text("Please Login using the below form", textAlign: TextAlign.start, style: TextStyle(fontSize: 12, fontFamily: AppStrings.timesFont, color: AppColors.titlesColor)),
                      ),
                      20.gap,
                      const HeroWidget(
                        tag: AppStrings.titleTag,
                        child: Text("Email", textAlign: TextAlign.start, style: TextStyle(fontSize: 12, fontFamily: AppStrings.timesFont, color: AppColors.titlesColor)),
                      ),
                      5.gap,
                      HeroWidget(
                        tag: AppStrings.emailTag,
                        child: FormFieldWidget(
                          padding: 0,
                          placeholder: AppStrings.emailText,
                          prefixIcon: const Icon(Icons.email_outlined),
                          onSaved: (String? value) {
                            controller.email = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.emailText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                            } else if (!RegExp(r"^[^@.]$").hasMatch(value[0]) || !RegExp(r"^[^@.]$").hasMatch(value[value.length - 1]) || RegExp(r'[^\w@.]').hasMatch(value)) {
                              return AppStrings.invalidEmailValidation;
                            } else if (!value.contains(AppStrings.atSign)) {
                              return AppStrings.emailDoesNotContainAtValidation;
                            }
                            return null;
                          },
                        ),
                      ),
                      16.gap,
                      const HeroWidget(
                        tag: AppStrings.titleTag,
                        child: Text("Password", textAlign: TextAlign.start, style: TextStyle(fontSize: 12, fontFamily: AppStrings.timesFont, color: AppColors.titlesColor)),
                      ),
                      HeroWidget(
                        tag: AppStrings.passwordTag,
                        child: GetBuilder<LoginController>(
                          builder: (_) {
                            return FormFieldWidget(
                              padding: 0,
                              placeholder: AppStrings.passwordText,
                              obscure: controller.obscure,
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.obscure = !controller.obscure;
                                  controller.update();
                                },
                                child: Icon(controller.obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                              ),
                              onSaved: (String? value) {
                                controller.password = value!.trim();
                                controller.update();
                              },
                              onChanged: (_) {
                                controller.checkFields();
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                                } else if (value.length < 8) {
                                  return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.lessThen8Validation;
                                } else if (value.length > 24) {
                                  return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                                }
                                return null;
                              },
                            );
                          },
                        ),
                      ),
                      5.gap,
                      InkWell(
                        onTap: () => Get.offNamed(AppStrings.resetPasswordRoute),
                        child: const Text(
                          "Forget Password?",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.black),
                        ),
                      ),
                      20.gap,
                      HeroWidget(
                        tag: AppStrings.buttonTag,
                        child: Center(
                          child: GetBuilder<LoginController>(
                            builder: (_) {
                              return InkWell(
                                onTap: controller.isLoading ? () {} : controller.login,
                                child: Container(
                                  height: 50,
                                  width: 400,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(borderRadius: 8.borderRadiusAll, color: AppColors.blue),
                                  child:
                                  controller.isLoading
                                      ? 30.lightLoading
                                      : const Text(AppStrings.loginText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      10.gap,
                      HeroWidget(
                        tag: AppStrings.textButtonTag,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(AppStrings.doNotHaveAnAccountText + AppStrings.questionSign, style: TextStyle(fontSize: 12, color: AppColors.black)),
                            InkWell(
                              onTap: () => Get.offNamed(AppStrings.signupRoute),
                              child: Container(
                                padding: 8.edgeInsetsAll,
                                alignment: Alignment.center,
                                child: const Text(
                                  AppStrings.signUpText,
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
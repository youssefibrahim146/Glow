
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controller/signup_controller.dart';
import '../widgets/form_field_widget.dart';
import '../widgets/hero_widget.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: 10.edgeInsetsAll,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: controller.signUpFormStateKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  20.gap,
                  Hero(tag: AppStrings.logoTag, child: Center(child: Image.asset("assets/signup.png", height: 100, width: 300))),
                  1.gap,
                  const HeroWidget(tag: AppStrings.titleTag, child: Text("Parents Information", textAlign: TextAlign.start, style: TextStyle(fontSize: 16, color: AppColors.titlesColor,fontWeight: FontWeight.bold))),
                  10.gap,
                  const HeroWidget(tag: AppStrings.titleTag, child: Text("Please Sign Up using the below form", textAlign: TextAlign.start, style: TextStyle(fontSize: 12, color: AppColors.titlesColor))),
                  20.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Parent Name", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  10.gap,
                  HeroWidget(
                    tag: AppStrings.emailTag,
                    child: FormFieldWidget(
                      padding: 0,
                      placeholder: AppStrings.nameText,
                      prefixIcon: const Icon(Icons.person_outline),
                      onSaved: (String? value) {
                        controller.parent_name = value!.trim();
                        controller.update();
                      },
                      onChanged: (_) {
                        controller.checkFields();
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                        } else if (value.length < 4) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.lessThen4Validation;
                        } else if (value.length > 24) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                        }
                        return null;
                      },
                    ),
                  ),
                  16.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Guardian", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  10.gap,
                  /// radio buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: controller.isGuardian,
                        onChanged: (value) {
                          controller.isGuardian = value!;
                          controller.update();
                        },
                      ),
                      const Text("Father"),
                      20.gap,
                      Radio(
                        value: 2,
                        groupValue: controller.isGuardian,
                        onChanged: (value) {
                          controller.isGuardian = value!;
                          controller.update();
                        },
                      ),
                      const Text("Mother"),
                    ],
                  ),
                  16.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Parent Number", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  10.gap,
                  HeroWidget(
                    tag: AppStrings.emailTag,
                    child: FormFieldWidget(
                      padding: 0,
                      placeholder: AppStrings.phoneText,
                      prefixIcon: const Icon(Icons.phone_outlined),
                      onSaved: (String? value) {
                        controller.guardian_number = value!.trim();
                        controller.update();
                      },
                      onChanged: (_) {
                        controller.checkFields();
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.phoneText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                        } else if (value.length < 4) {
                          return AppStrings.phoneText + AppStrings.spaceSign + AppStrings.lessThen4Validation;
                        } else if (value.length > 24) {
                          return AppStrings.phoneText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                        }
                        return null;
                      },
                    ),
                  ),
                  16.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Child Information", style: TextStyle(fontSize: 16, color: AppColors.black,fontWeight: FontWeight.bold)),
                  ),
                  10.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Child Full Name", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  10.gap,
                  HeroWidget(
                    tag: AppStrings.emailTag,
                    child: FormFieldWidget(
                      padding: 0,
                      placeholder: AppStrings.nameText,
                      prefixIcon: const Icon(Icons.person_outline),
                      onSaved: (String? value) {
                        controller.child_name = value!.trim();
                        controller.update();
                      },
                      onChanged: (_) {
                        controller.checkFields();
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                        } else if (value.length < 4) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.lessThen4Validation;
                        } else if (value.length > 24) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                        }
                        return null;
                      },
                    ),
                  ),
                  16.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Child Email", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  FormFieldWidget(
                    padding: 0,
                    placeholder: AppStrings.emailText,
                    prefixIcon: const Icon(Icons.email_outlined),
                    onSaved: (String? value) {
                      controller.child_email= value!.trim();
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
                  16.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Child Number", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  10.gap,
                  HeroWidget(
                    tag: AppStrings.emailTag,
                    child: FormFieldWidget(
                      padding: 0,
                      placeholder: AppStrings.phoneText,
                      prefixIcon: const Icon(Icons.phone_outlined),
                      onSaved: (String? value) {
                        controller.child_number = value!.trim();
                        controller.update();
                      },
                      onChanged: (_) {
                        controller.checkFields();
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.phoneText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                        } else if (value.length < 4) {
                          return AppStrings.phoneText + AppStrings.spaceSign + AppStrings.lessThen4Validation;
                        } else if (value.length > 24) {
                          return AppStrings.phoneText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                        }
                        return null;
                      },
                    ),
                  ),
                  16.gap,
                  /// date of birth
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Child Date of Birth", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  10.gap,
                  HeroWidget(
                    tag: AppStrings.emailTag,
                    child: FormFieldWidget(
                      padding: 0,
                      placeholder: "DD/MM/YYYY",
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      onSaved: (String? value) {
                        controller.child_dob = value!.trim();
                        controller.update();
                      },
                      onChanged: (_) {
                        controller.checkFields();
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                        } else if (value.length < 4) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.lessThen4Validation;
                        } else if (value.length > 24) {
                          return AppStrings.nameText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                        }
                        return null;
                      },
                    ),
                  ),
                  16.gap,
                  const HeroWidget(
                    tag: AppStrings.subTitleTag,
                    child: Text("Password", style: TextStyle(fontSize: 12, color: AppColors.black)),
                  ),
                  10.gap,
                  HeroWidget(
                    tag: AppStrings.passwordTag,
                    child: GetBuilder<SignUpController>(
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
                  20.gap,
                  HeroWidget(
                    tag: AppStrings.buttonTag,
                    child: Center(
                      child: GetBuilder<SignUpController>(
                        builder: (_) {
                          return InkWell(
                            onTap: controller.isLoading ? () {} : controller.signUp,
                            child: Container(
                              height: 50,
                              width: 350,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: 15.borderRadiusAll, color: AppColors.blue),
                              child:
                              controller.isLoading
                                  ? 30.lightLoading
                                  : const Text(AppStrings.signUpText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white)),
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
                        const Text(AppStrings.alreadyHaveAnAccountText + AppStrings.questionSign, style: TextStyle(fontSize: 12, color: AppColors.black)),
                        InkWell(
                          onTap: () => Get.offNamed(AppStrings.loginRoute),
                          child: Container(
                            padding: 8.edgeInsetsAll,
                            alignment: Alignment.center,
                            child: const Text(
                              AppStrings.loginText,
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
    );
  }
}
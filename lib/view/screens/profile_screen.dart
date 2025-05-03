import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';
import 'package:glow/constants/strings.dart';
import 'package:glow/controller/profile_controller.dart';

import '../../constants/colors.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.gap,
              Row(
                children: [
                  Image.asset("assets/home_logo.png"),
                  const Spacer(),
                  InkWell(
                    child: Text("Logout"),
                    onTap: () {
                      controller.logout();
                    },
                  ),
                ],
              ),
              40.gap,
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.blue,
                    radius: 28,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person, color: AppColors.white),
                    ),
                  ),
                  10.gap,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.user.childName,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        controller.user.isAutism ? "Autism" : "NON-Autism",
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.gap,
              Text(
                "Your Information",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.lightBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.gap,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBlack,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Child Name: ${controller.user.childName}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.titlesColor,
                        ),
                      ),
                      20.gap,
                      Text(
                        "Child Email: ${controller.user.childEmail}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.titlesColor,
                        ),
                      ),
                      20.gap,
                      Text(
                        "Child Date of Birth: ${controller.user.childDob}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.titlesColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.gap,
              /// retake autism test
              InkWell(
                onTap: () {
                  Get.toNamed(AppStrings.autismTestRoute);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Retake Autism Test",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

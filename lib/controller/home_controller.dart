
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';

import '../constants/strings.dart';
import '../model/services/firebase_services.dart';
import '../model/task_model.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  bool isExpanded = false;
  num totalTotalPrice = 0;
  bool isFavLoading = false;
  bool isCartLoading = false;
  UserModel? user;
  //UserModel user = Get.arguments[0];
  //List<TaskModel> recommendedFoodsList = [];
  String selectedScreen = AppStrings.homeText;
  //List<TaskModel> foodsList = Get.arguments[1];
  String selectedCategory = AppStrings.allText;
  TextEditingController searchController = TextEditingController();
  //List<String> categoriesList = [AppStrings.allText, AppStrings.mainDishesText, AppStrings.appetizersAndSidesText];
 // List<TaskModel> foodsMainDishesList = Get.arguments[1].where((element) => element.category == AppStrings.mainDishesText).toList();
 // List<TaskModel> foodsAppetizersAndSidesList = Get.arguments[1].where((element) => element.category == AppStrings.appetizersAndSidesText).toList();
  List<TaskModel> tasksList = [
    TaskModel(
      id: "1",
      title: "Say HI",
      description: "Say Hi To Your Family",
      isCompleted: false,
      image: 'https://t3.ftcdn.net/jpg/05/63/57/88/360_F_563578848_R2IfcCZZrgOwbQksH77osgthbR8BSTXP.jpg',
      points: 10,
      steps: "Step 1",
    ),
    TaskModel(
      id: "2",
      title: "Look outside",
      description: "Look from the window",
      isCompleted: true,
      image: "https://thumbs.dreamstime.com/b/out-window-looking-century-old-farmhouse-view-lakeshore-field-wagon-wheel-fayette-state-historical-42502680.jpg",
      points: 20,
      steps: "Step 2",
    ),
    TaskModel(
      id: "3",
      title: "Feed an animal",
      description: " Feed an animal in street",
      isCompleted: false,
      image: "https://images.squarespace-cdn.com/content/v1/5a3c294ff14aa168470e1674/1667164469719-SUQCSYGKO2Z1VEBGUMOB/nutrition+pic.jpg?format=1000w",
      points: 30,
      steps: "Step 3",
    ),
  ];



  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments.length > 0) {
      user = Get.arguments[0];
    } else {
      user = null;
    }
    //getRecommendedFoodsList();
    //getTotalPrice();
    //print(user);
    super.onInit();
  }
  void updateTaskStatus(String taskId, bool isCompleted) {
    TaskModel task = tasksList.firstWhere((task) => task.id == taskId);
    task.isCompleted = isCompleted;
    debugPrint("Task ID: $taskId, Completed: ${task.isCompleted}");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  int completedTasksCount() {
    int count = 0;
    for (TaskModel task in tasksList) {
      if (task.isCompleted) {
        count++;
      }
    }
    return count;
  }
  void updateFavList(String foodId) async {
   /*isFavLoading = true;
    update();
    await FirebaseServices.updateUserFavFood(foodId).then((value) {
      if (value is bool && value) {
        if (!user.fav.contains(foodId)) {
          user.fav .add(foodId);
          update();
        } else {
          user.fav.remove(foodId);
          update();
        }
      } else {
        value.toString().showToast;
      }
    });
    isFavLoading = false;
    update();*/
  }

  void updateCartList(String foodId) async {
   /* isCartLoading = true;
    update();
    await FirebaseServices.updateUserCartFood(foodId).then((value) {
      if (value is bool && value) {
        if (!user.cart.contains(foodId)) {
          user.cart.add(foodId);
          update();
        } else {
          user.cart.remove(foodId);
          update();
        }
      } else {
        value.toString().showToast;
      }
    });
    isCartLoading = false;
    update();*/
  }

  void getTotalPrice() {
    /*totalTotalPrice = 0;
    for (FoodModel food in foodsList.where((food) => user.cart.contains(food.id)).toList()) {
      totalTotalPrice += food.totalPrice;
    }*/
  }

  void getRecommendedFoodsList() {
    /*foodsList.sort((a, b) => b.selled.compareTo(a.selled));
    recommendedFoodsList = foodsList.take(5).toList();*/
  }
}
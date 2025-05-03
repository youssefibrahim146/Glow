
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';
import 'package:glow/model/task_model.dart';

import '../constants/strings.dart';
import '../model/services/firebase_services.dart';
import '../model/user_model.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  /// To get the data.
  Future<void> getData() async {
    //dynamic fetchFoodsResponse = await FirebaseServices.fetchTasks();
    dynamic fetchUserResponse = await FirebaseServices.fetchCurrentUser();
    await Future.delayed(5.sec, () {
      //fetchFoodsResponse is List<TaskModel> &&
      if ( fetchUserResponse is UserModel) {
        //, fetchFoodsResponse
        Get.offNamed(AppStrings.homeRoute, arguments: [fetchUserResponse]);
      } else {
        //fetchFoodsResponse.toString().showToast;
        fetchUserResponse.toString().showToast;
      }
    });
  }
}
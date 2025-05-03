
import 'package:get/get.dart';
import 'package:glow/controller/profile_controller.dart';

import '../controller/home_controller.dart';
import '../controller/login_controller.dart';
import '../controller/signup_controller.dart';
import '../controller/splashController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => HomeController(), fenix: true);
   Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
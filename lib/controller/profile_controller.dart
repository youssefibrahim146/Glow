import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';
import 'package:glow/model/services/auth_sercives.dart';
import 'package:glow/model/user_model.dart';

class ProfileController extends GetxController {
  UserModel user = Get.arguments[0];

  logout()async {
    await FirebaseAuthService().signOut().then(
      (value) {
        if (value == null) {
          Get.offAllNamed("/login");
        } else {
          value.toString().showToast;
        }
      },
    );
    Get.offAllNamed("/login");
  }
}
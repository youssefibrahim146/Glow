
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';
import 'package:glow/constants/strings.dart';
import 'package:glow/view/screens/autism_test_screen.dart';
import 'package:glow/view/screens/home_screen.dart';
import 'package:glow/view/screens/profile_screen.dart';
import 'package:glow/view/screens/signup_screen.dart';

import '../view/screens/login_screen.dart';
import '../view/screens/splash_screen.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppStrings.splashRoute, page: () => const SplashScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.loginRoute, page: () => const LoginScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.signupRoute, page: () => const SignUpScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.homeRoute, page: () => const HomeScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    //GetPage(name: "/route", page: () => const CheckOutScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.profileRoute, page: () => const ProfileScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.autismTestRoute, page: () => const AutismTestScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),

  ];
}
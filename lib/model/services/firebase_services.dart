import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glow/model/task_model.dart';

import '../../constants/strings.dart';
import '../user_model.dart';

class FirebaseServices {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// To add new user to users collection.
  static Future<dynamic> uploadUser(UserModel user) async {
    try {
      await _firestore.collection(AppStrings.usersCollection).doc(
          user.childEmail).set(user.asMap());
      return user;
    } catch (error) {
      return error.toString();
    }
  }

  /// To fetch the current user date.
  static Future<dynamic> fetchCurrentUser() async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc = await _firestore.collection(
            AppStrings.usersCollection).doc(currentUser.email).get();
        if (userDoc.exists) {
          print(userDoc);
          UserModel user = UserModel.fromMap(
              userDoc.data() as Map<String, dynamic>);
          return user;
        } else {
          print(AppStrings.unknownErrorToast);
          return AppStrings.unknownErrorToast;
        }
      } catch (error) {
        print(error);
        return error.toString();
      }
    } else {
      print(AppStrings.unknownErrorToast);
      UserModel user = UserModel(
        parentName: AppStrings.emptySign,
        guardian: AppStrings.emptySign,
        guardianNumber: AppStrings.emptySign,
        childName: AppStrings.emptySign,
        childEmail: AppStrings.emptySign,
        childNumber: AppStrings.emptySign,
        childDob: AppStrings.emptySign,
        isAutism: false,
      );
      return user;
    }
  }


  /// To update autism state
  static Future<dynamic> updateIsAutism(bool isAutism) async {
    try {
      final userRef = FirebaseFirestore.instance.collection(
          AppStrings.usersCollection).doc(_firebaseAuth.currentUser!.email);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final snapshot = await transaction.get(userRef);


        transaction.update(userRef, {AppStrings.isAutismField: isAutism});
        return true;
      });
          } catch (error)
      {
        return error.toString();
      }
    }
}
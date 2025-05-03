import '../constants/strings.dart';

class UserModel {
  String parentName;
  String guardian;
  String guardianNumber;
  String childName;
  String childEmail;
  String childNumber;
  String childDob;
  bool isAutism;

  UserModel({
    required this.parentName,
    required this.guardian,
    required this.guardianNumber,
    required this.childName,
    required this.childEmail,
    required this.childNumber,
    required this.childDob,
    required this.isAutism,
  });

  Map<String, dynamic> asMap() {
    return {
      AppStrings.parentnameField: parentName,
      AppStrings.guardianField: guardian,
      AppStrings.guardianNumberField: guardianNumber,
      AppStrings.childNameField: childName,
      AppStrings.childEmailField: childEmail,
      AppStrings.childNumberField: childNumber,
      AppStrings.dateField: childDob,
      AppStrings.isAutismField: isAutism,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      parentName: map[AppStrings.parentnameField],
      guardian: map[AppStrings.guardianField],
      guardianNumber: map[AppStrings.guardianNumberField],
      childName: map[AppStrings.childNameField],
      childEmail: map[AppStrings.childEmailField],
      childNumber: map[AppStrings.childNumberField],
      childDob: map[AppStrings.dateField],
      isAutism: map[AppStrings.isAutismField],
    );
  }
}

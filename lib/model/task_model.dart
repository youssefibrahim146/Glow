
import '../constants/strings.dart';

class TaskModel{
  String id;
  String title;
  String description;
  String image;
  int points;
  String steps;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.image,
    required this.points,
    required this.steps,
  });

}
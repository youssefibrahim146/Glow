import 'package:flutter/material.dart';
import 'package:glow/constants/colors.dart';
import 'package:glow/constants/extensions.dart';

import '../../model/task_model.dart';

class TaskCard extends StatelessWidget {
  final VoidCallback onTap;
  final TaskModel task;

  const TaskCard({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Image.network(
              task.image,
              fit: BoxFit.cover,
              height: 90,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: 8.edgeInsetsHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    5.gap,
                    Text(
                      task.description,
                      style: const TextStyle(fontSize: 7, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    15.gap,
                    Text(
                      "${task.points} points",
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    20.gap,
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:
                            task.isCompleted
                                ? Container(
                              margin: 5.edgeInsetsHorizontal,
                                child: Icon(Icons.library_add_check,color: AppColors.white,size: 15,))
                                : const Text(
                                  "Done",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

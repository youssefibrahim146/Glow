import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glow/constants/extensions.dart';
import 'package:glow/view/widgets/task_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controller/home_controller.dart';
import '../widgets/hero_widget.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> banners = ["assets/banner_1.png"];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.gap,
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppStrings.profileRoute,
                      arguments: [controller.user],
                    );
                  },
                  child: Row(
                    children: [
                      HeroWidget(
                        tag: AppStrings.titleTag,
                        child: Image.asset(
                          "assets/home_logo.png",
                          height: 50,
                          width: 120,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.lightBlack,
                            radius: 20,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          10.gap,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                  color: AppColors.lightBlack,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                controller.user!.childName,
                                style: TextStyle(
                                  color: AppColors.titlesColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                33.gap,
                CarouselSlider.builder(
                  itemCount: banners.length,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    height: 150,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 0.9,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.easeIn,
                  ),
                  itemBuilder: (_, int index, __) {
                    return Container(
                      width: 420,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(banners[index], fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                35.gap,
                Padding(
                  padding: 10.edgeInsetsHorizontal,
                  child: Text(
                    "My Daily Progress",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                12.gap,

                ///completed tasks
                Padding(
                  padding: 10.edgeInsetsHorizontal,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 28,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.check, color: AppColors.white),
                        ),
                      ),
                      11.gap,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GetBuilder(
                                builder: (HomeController controller) {
                                  return Text(
                                    "${controller.completedTasksCount().toString()} / ${controller.tasksList.length}",
                                    style: TextStyle(
                                      color: AppColors.titlesColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),

                              5.gap,
                              Text(
                                "Tasks Completed",
                                style: TextStyle(
                                  color: AppColors.lightBlack,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          5.gap,
                          SizedBox(
                            width: 250,
                            child: GetBuilder<HomeController>(
                              builder: (context) {
                                return StepProgressIndicator(
                                  totalSteps: controller.tasksList.length,
                                  currentStep: controller.completedTasksCount(),
                                  size: 8,
                                  padding: 0,
                                  selectedColor: Colors.green,
                                  unselectedColor: AppColors.lightBlack,
                                  roundedEdges: Radius.circular(10),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                20.gap,
                Padding(
                  padding: 10.edgeInsetsHorizontal,
                  child: Text(
                    "My Tasks",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                12.gap,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.94,
                        ),
                    itemCount: controller.tasksList.length,
                    itemBuilder: (context, index) {
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
                                controller.tasksList[index].image,
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
                                        controller.tasksList[index].title,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      5.gap,
                                      Text(
                                        controller.tasksList[index].description,
                                        style: const TextStyle(fontSize: 7, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      15.gap,
                                      Text(
                                        "${controller.tasksList[index].points} points",
                                        style: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      20.gap,
                                      InkWell(
                                        onTap: () {
                                          controller.updateTaskStatus(
                                            controller.tasksList[index].id,
                                            !controller.tasksList[index].isCompleted,
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child:
                                          GetBuilder<HomeController>(
                                            builder: (_) {
                                              return controller.tasksList[index].isCompleted
                                                  ? Container(
                                                  margin: 5.edgeInsetsHorizontal,
                                                  child: Icon(Icons.library_add_check,color: AppColors.white,size: 15,))
                                                  : const Text(
                                                "Done",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                ),
                                              );
                                            }
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
                      /*return TaskCard(
                        task: controller.tasksList[index],
                        onTap: () {
                          controller.updateTaskStatus(
                            controller.tasksList[index].id,
                            !controller.tasksList[index].isCompleted,
                          );
                        },
                      );*/
                    },
                  ),
                ),

                20.gap,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
